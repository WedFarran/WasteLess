import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/map/presentation/widgets/filtering_options_widget.dart';
//import 'package:wasteless/features/driver%20features/map/data/models/driver_map_model.dart';
//import 'package:wasteless/features/driver%20features/map/presentation/widgets/filtering_options_widget.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';
import '../../../../../core/widgets/map_widgets/filtering_button.dart';
import '../../../../admin features/map/data/models/bins_models.dart';
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
  bool fullCheck = false;
  bool halfFullCheck = false;
  bool emptyCheck = false;
  bool driversCheck = false;
  BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor brokenBinMarker = BitmapDescriptor.defaultMarker;
  late var currentUserId = '';
  double percent = 0.3;

  @override
  void initState() {
    super.initState();
    setCustomerMarkerIcon();

    var currentUserId = FirebaseAuth.instance.currentUser!.uid;

    ref = FirebaseDatabase.instance.ref('bin');
    retrieveBins = ref.orderByChild("driverId").equalTo(currentUserId);
  }

  setCustomerMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN)
        .then((icon) => {fullBinMarker = icon});
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
              onTap: () => showBottomSheet(
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

  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    setCustomerMarkerIcon();
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: SizedBox(
          height: context.height * 0.19,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilteringButton(
                  fullOnTap: () {
                    setState(() {
                      fullCheck = !fullCheck;
                    });
                  },
                  fullSelected: fullCheck,
                  halfFullOnTap: () {
                    setState(() {
                      halfFullCheck = !halfFullCheck;
                    });
                  },
                  halfFullSelected: halfFullCheck,
                  emptyOnTap: () {
                    setState(() {
                      emptyCheck = !emptyCheck;
                    });
                  },
                  emptySelected: emptyCheck,
                  resetOnTap: () {
                    setState(() {
                      emptyCheck = true;
                      halfFullCheck = true;
                      fullCheck = true;
                      driversCheck = true;
                    });
                  },
                ),
                NavigationButtonWidget(selected: true, ontap: () {}),
              ]),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: retrieveBins.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                Map<String, dynamic> map = Map<String, dynamic>.from(
                    snapshot.data!.snapshot.value as Map);
                List binsList = map.values.toList();

                print(map);

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
                  markers: Set.from(getGeoCords(binsList)),
                );
              }
            }),
      ),
    );
  }
}
