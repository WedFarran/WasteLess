import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/model/bins_models.dart';
import '../../../../../core/providers/map/filtering_change_notifier.dart';
import '../../../../../core/tools/map_tools.dart';
import '../../../../../core/widgets/map_widgets/filterin_floating_action_button.dart';
import '../widgets/driver_filtering_options_widget.dart';
import '../widgets/navigation_button_widget.dart';

class DriverMapScreen extends StatefulWidget {
  static const String id = 'driver_map_screen';

  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  late GoogleMapController mapController;
  late Query retrieveBins;
  late DatabaseReference ref;
  late var currentUserId = '';

  double lat = 21.42462845849512;
  double lng = 39.82612550889805;

  @override
  void initState() {
    _liveLocation();
    getCurrentLocation();
    setCustomeMarkerIcon();
    var currentUserId = FirebaseAuth.instance.currentUser!.uid;
    ref = FirebaseDatabase.instance.ref('bin');
    retrieveBins = ref.orderByChild("driverId").equalTo(currentUserId);

    super.initState();
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 1);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((position) {
      lat = position.latitude;
      lng = position.longitude;
      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(position.latitude, position.longitude))));
      });
    });
  }

  LatLng _initialPosition = const LatLng(21.42462845849512, 39.82612550889805);

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
                      NavigationButtonWidget(selected: true, ontap: () {}),
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
                    List<BinsModel> binsList = [];
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
                          initialCameraPosition: CameraPosition(
                              target: _initialPosition, zoom: 13),
                          onMapCreated: (controler) {
                            setState(
                              () {
                                mapController = controler;
                                _liveLocation();
                                mapController.setMapStyle(
                                    '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
                              },
                            );
                          },
                          markers: Set.from(getBinsGeoCords(
                              binsList,
                              context,
                              filteringOptions.fullCheck,
                              filteringOptions.halfFullCheck,
                              filteringOptions.emptyCheck,
                              LatLng(lat, lng))));
                    });
                  }
                })));
  }
}
