import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/common/data/models/bins_models.dart';
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
  static const LatLng SOURCE_LOCATION = LatLng(21.357832620119908, 39.78452627440951);
  static const LatLng DEST_LOCATION = LatLng(21.34404297896124, 39.7866291263894);
  late LatLng currentLocation;
  late LatLng destinationLocation;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;



  late var currentUserId = '';
  late Position _currentPosition;
  final LatLng _initialPosition =
  const LatLng(21.42462845849512, 39.82612550889805);
  final Set<Marker> markers = {};
  List<BinsModel> binsList = [];

  //late List<Polyline> _polylines = [];


  @override
  void initState() {
    setCustomeMarkerIcon();
    var currentUserId = FirebaseAuth.instance.currentUser!.uid;
    ref = FirebaseDatabase.instance.ref('bin');
    retrieveBins = ref.orderByChild("driverId").equalTo(currentUserId);
    polylinePoints = PolylinePoints();
    //this.setInitialLocation();

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

  List<LatLng> _polylineCoordinates = [];
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
                      NavigationButtonWidget(selected: true, ontap: ()  {
                        setPolylines();
                       /* _polylineCoordinates.add(LatLng(21.357832620119908, 39.78452627440951));
                        _polylineCoordinates.add(LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude));
                        _polylines.clear();
                        _polylines.add(Polyline(
                            polylineId: PolylineId('polyline_1'),
                        color: Colors.blue,
                        width: 5,
                        points: _polylineCoordinates,));*/
                        setState(() {

                        });

                      })]))),
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
                          initialCameraPosition: CameraPosition(
                              target: _initialPosition, zoom: 13),
                          onMapCreated: (controler) {
                            setState(
                              () {
                                mapController = controler;
                               // setPolylines();
                                mapController.setMapStyle(
                                    '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');


                              });
                          },

                          markers: Set.from(getBinsGeoCords(
                              binsList,
                              context,
                              filteringOptions.fullCheck,
                              filteringOptions.halfFullCheck,
                              filteringOptions.emptyCheck,)),
                      );
                    });
                  }

                })));
  }
void setPolylines() async {
  List<PolylineWayPoint> polylineCoordinates = [];
  List<PointLatLng> locations = [];

  binsList.forEach((location) {
    if(location.wasteLevel>0.6){
      locations.add(PointLatLng(location.lat, location.lng));
    }
  });

  List<PolylineWayPoint> polylineWayPoints = locations.map((location) {

    return PolylineWayPoint(location: location.toString());
  }).toList();

  _getCurrentLocation().then((value) {
    currentLocation = LatLng(value.latitude, value.longitude) ;
    locations.add(PointLatLng(currentLocation.latitude, currentLocation.longitude));
  });
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    'AIzaSyAVSFYwmtyPBRcXlXx7LQjd8QgvqwtyTNY', // replace with your own API key

    polylineCoordinates.first as PointLatLng,
    polylineCoordinates.last as PointLatLng,
 wayPoints: polylineCoordinates,
  );

  if (result.points.isNotEmpty) {
    polylineCoordinates.clear();
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(PolylineWayPoint( location: PointLatLng(point.latitude, point.longitude).toString()));
    });

    setState(() {
      _polylines.add(Polyline(
        width: 5,
        polylineId: PolylineId('route'),
        color: Colors.red,
        points: polylineCoordinates as dynamic,
      ));
    });
  }

  }
}


