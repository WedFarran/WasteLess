// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/widgets/map_widgets/filtering_button.dart';
import '../map_tools.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;

  final ref = FirebaseDatabase.instance.ref().child('bin');
  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    setCustomeMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FilteringButton(image: FILTRING_ICON, onTap: () {}),
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
                  list = map.values.toList();

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
                        },
                      );
                    },
                    markers: Set.from(getGeoCords(list, context, emptyBinMarker,
                        fullBinMarker, halfFullBinMarker, brokenBinMarker)),
                  );
                }
              }),
        ));
  }
}
