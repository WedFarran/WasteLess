import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/common/data/models/bins_models.dart';
import '../../../../../core/providers/map/filtering_change_notifier.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/filterin_floating_action_button.dart';
import '../location_service.dart';
import '../widgets/driver_filtering_options_widget.dart';
import '../widgets/navigation_button_widget.dart';

class DriverMapScreen extends StatefulWidget {
  static const String id = 'driver_map_screen';

  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  Completer<GoogleMapController> mapController = Completer();
  late Query retrieveBins;
  late DatabaseReference ref;

  late var currentUserId = '';
  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  List<BinsModel> binsList = [];

  List<BinsAndDistances> distance = [];

  // ignore: prefer_collection_literals, prefer_final_fields
  Set<Polyline> _polylines = Set<Polyline>();

  int _polylineIdCounter = 1;

  void setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    _polylines.add(Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.blue,
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()));
    setState(() {});
  }

  @override
  void initState() {
    setCustomeMarkerIcon();
    var currentUserId = FirebaseAuth.instance.currentUser!.uid;
    ref = FirebaseDatabase.instance.ref('bin');
    retrieveBins = ref.orderByChild("driverId").equalTo(currentUserId);
    super.initState();
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location P are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('location P are permanently denied');
    }
    return Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: SizedBox(
                height: context.height * 0.19,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FilterinFloatingActionButton(
                        widget: DriverMapFilteringOptionsWidget(),
                      ),
                      FloatingActionButton(
                          backgroundColor: WHITE,
                          onPressed: () async {
                            getNavigationLocations();
                            Position driverPosition =
                                await _getCurrentLocation();
                            var directions = await getDirections(
                                '${driverPosition.latitude},${driverPosition.longitude}',
                                distance);
                            goToPlace(
                              directions['start_location']['lat'],
                              directions['start_location']['lat'],
                              directions['bounds_ne'],
                              directions['bounds_sw'],
                            );
                            setPolyline(directions['polyline_decoded']);
                            // ignore: use_build_context_synchronously
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(40))),
                                builder: (context) => NavigationButtonWidget(
                                      km: 55,
                                      ontap: () {
                                        getNavigationLocations();

                                        _launchURL(distance);
                                      },
                                      selected: true,
                                      time: '15',
                                      close: () {
                                        _polylines.clear();
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                    ));
                          },
                          child: Image.asset(NAVIGATION_ICON,
                              height: context.height * 0.07))
                    ]))),
        body: SafeArea(
            child: StreamBuilder(
                stream: retrieveBins.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    Map<String, dynamic> map = Map<String, dynamic>.from(
                        snapshot.data!.snapshot.value as Map);

                    map.forEach((key, value) {
                      binsList.add(BinsModel(
                          id: key,
                          fullnesTime: value['fullnesTime'],
                          wasteLevel: value['wasteLevel'],
                          lat: value['lat'],
                          lng: value['lng'],
                          status: value['status']));
                    });

                    return Consumer<FilteringChangeNotifier>(
                        builder: (context, filteringOptions, child) {
                      if (binsList.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return GoogleMap(
                        myLocationEnabled: true,
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        polylines: _polylines,
                        initialCameraPosition:
                            CameraPosition(target: _initialPosition, zoom: 13),
                        onMapCreated: (controler) {
                          setState(() {
                            mapController.complete(controler);
                            // setPolylines();
                            // mapController.setMapStyle(
                            // '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
                          });
                        },
                        markers: Set.from(getBinsGeoCords(
                          binsList,
                          context,
                          filteringOptions.fullCheck,
                          filteringOptions.halfFullCheck,
                          filteringOptions.emptyCheck,
                        )),
                      );
                    });
                  }
                })));
  }

  _launchURL(List<BinsAndDistances> distance) async {
    Position driverPosition = await _getCurrentLocation();
    distance.sort((a, b) => a.distance.compareTo(b.distance));

    List<String> waypoints = distance
        .sublist(1, distance.length - 1)
        .map((waypoint) => "${waypoint.lat},${waypoint.lng}")
        .toList();

    String url =
        'https://www.google.com/maps/dir/?api=1&origin=${driverPosition.latitude},${driverPosition.longitude}&destination=${distance[distance.length - 1].lat},${distance[distance.length - 1].lng}&waypoints=${waypoints.join("|")}&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getNavigationLocations() async {
    distance.clear();
    Position driverLocation = await _getCurrentLocation();
    for (var bin in binsList) {
      bin.wasteLevel >= 0.8
          ? distance.add(BinsAndDistances(
              lat: bin.lat,
              lng: bin.lng,
              distance: calculateDistances(
                  LatLng(driverLocation.latitude, driverLocation.longitude),
                  LatLng(
                    bin.lat,
                    bin.lng,
                  ))))
          : null;
    }
  }

  void goToPlace(double lat, double lng, Map<String, dynamic> boundNe,
      Map<String, dynamic> boundSw) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundSw['lat'], boundSw['lng']),
            northeast: LatLng(boundNe['lat'], boundNe['lng'])),
        25));
  }
}
