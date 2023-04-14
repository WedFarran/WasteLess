// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../map_tools.dart';
import '../widgets/filtering_button_widget.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;

  // final ref = FirebaseDatabase.instance.ref().child('bin');
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
    DatabaseReference ref = FirebaseDatabase.instance.ref("bin");
    Stream<DatabaseEvent> stream = ref.onValue;
    List<dynamic> list = [];
    late bool fullSelected = false;
    late bool halfFullSelected = false;
    late bool emptySelected = false;
    late bool driversSelected = false;

    filtermarkers(List list) {
      List filterdMarkers = [];
      if (list.isNotEmpty) {
        if ((fullSelected &
                    halfFullSelected &
                    emptySelected &
                    driversSelected ==
                true) ||
            (fullSelected &
                    halfFullSelected &
                    emptySelected &
                    driversSelected ==
                false)) {
          filterdMarkers = list;
        } else if (fullSelected) {
        } else if (halfFullSelected) {}
      }
    }

    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: FloatingActionButton(
            backgroundColor: WHITE,
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
                builder: (context) => Container(
                      height: context.height * 0.33,
                      margin: const EdgeInsets.only(
                          top: 15, right: 20, bottom: 5, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    FILTRING_ICON,
                                    height: context.height * 0.02,
                                  ),
                                  Text(
                                    'Filter',
                                    style: anyColorSize16(FONT_GRAY),
                                  )
                                ],
                              ),
                              InkWell(
                                child:
                                    Text('Reset', style: anyColorSize16(BLACK)),
                                onTap: () => setState(() {
                                  fullSelected = false;
                                  halfFullSelected = false;
                                  emptySelected = false;
                                  driversSelected = false;
                                }),
                              ),
                            ],
                          ),
                          FilteringButtonWidget(
                            onTap: () {
                              setState(() {
                                fullSelected = !fullSelected;
                              });
                            },
                            selected: fullSelected,
                            icon: Full_BIN_ICON,
                            status: 'Full',
                          ),
                          FilteringButtonWidget(
                            onTap: () {
                              setState(() {
                                halfFullSelected = !halfFullSelected;
                              });
                            },
                            selected: halfFullSelected,
                            icon: HALF_FULL_BIN_ICON,
                            status: 'Half Full',
                          ),
                          FilteringButtonWidget(
                            onTap: () {
                              setState(() {
                                emptySelected = !emptySelected;
                              });
                            },
                            selected: emptySelected,
                            icon: EMPTY_BIN_ICON,
                            status: 'Empty',
                          ),
                          const Divider(
                            color: PRIMARY_BLUE,
                            thickness: 1,
                          ),
                          FilteringButtonWidget(
                            onTap: () {
                              setState(() {
                                driversSelected = !driversSelected;
                              });
                            },
                            selected: driversSelected,
                            icon: VEHICLE_ICON,
                            status: 'Drivers',
                          ),
                        ],
                      ),
                    )),
          ),
        ),
        /*FilteringButton(
            image: FILTRING_ICON,
            fullSelected: true,
            halfFullSelected: true,
            emptySelected: true,
            driversSelected: true,
            onTap: () {
              //filtermarkers(list);
            }),*/
        body: SafeArea(
          child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;

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
