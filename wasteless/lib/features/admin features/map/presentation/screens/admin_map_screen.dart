// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';
import '../widgets/filtering_options_widget.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;
  BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor brokenBinMarker = BitmapDescriptor.defaultMarker;
  double percent = 0.3;

  @override
  void initState() {
    super.initState();
    setCustomeMarkerIcon();
  }

  setCustomeMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN)
        .then((icon) => {fullBinMarker = icon});
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, VEHICLE_ICON)
        .then((icon) => {driverMarker = icon});
    setState(() {});
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, HALF_FULL_BIN_PIN)
        .then((icon) => {halfFullBinMarker = icon});
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, EMPTY_BIN_PIN)
        .then((icon) => {emptyBinMarker = icon});
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, BROKEN_BIN_ICON)
        .then((icon) => {brokenBinMarker = icon});
  }

  getGeoCords(list) {
    List markersList = [];
    markersList = list
        .map((e) => Marker(
              markerId: MarkerId(e.toString()),
              icon: e['status'] == true
                  ? e['wasteLevel'] < 0.4
                      ? emptyBinMarker
                      : e['wasteLevel'] >= 0.8
                          ? fullBinMarker
                          : halfFullBinMarker
                  : brokenBinMarker,
              onTap: () => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  backgroundColor: WHITE,
                  context: context,
                  builder: (context) => BinDetailsWidget(
                        percent: e['wasteLevel'],
                        location: 'Abdullah Arif st',
                        fullnesTime: e['fullnesTime'],
                      )),
              position: LatLng(e['lat'], e['lng']),
            ))
        .toList();

    return markersList;
  }

  List<Marker> markersList = [];

  final ref = FirebaseDatabase.instance.ref().child('bin');

  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: FloatingActionButton(
            child: Image.asset(
              FILTRING_ICON,
              height: context.height * 0.04,
            ),
            onPressed: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                backgroundColor: WHITE,
                context: context,
                builder: (context) => FilteringOptionsWidget(
                      selected: true,
                      ontap: () {},
                    )),
          ),
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();

                  //createMarkers(list);

                  print('Wed Wed Wed Wed Wed Wed Wed Wed $list');

                  return GoogleMap(
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    initialCameraPosition:
                        CameraPosition(target: _initialPosition, zoom: 13),
                    onMapCreated: (controler) {
                      setState(
                        () {
                          mapController = controler;
                          mapController.setMapStyle(
                              '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
                          // mapMarkers(list);
                        },
                      );
                    },
                    markers: Set.from(getGeoCords(list)),
                  );
                }
              }),
        ));
  }

  void onCreated(GoogleMapController controller, List list) {
    setState(() {
      mapController = controller;
      mapController.setMapStyle(
          '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
    });
  }

  void mapMarkers(List list) {}
}
