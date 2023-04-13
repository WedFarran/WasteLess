import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/driver%20features/map/presentation/widgets/filtering_options_widget.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';
import '../widgets/navigation_button_widget.dart';

class DriverMapScreen extends StatefulWidget {
  static const String id = 'driver_map_screen';

  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  late GoogleMapController mapController;
  BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor brokenBinMarker = BitmapDescriptor.defaultMarker;
  double percent = 0.3;
  List<Data> _allData = [
    Data('Bin 1', 'Full'),
    Data('Bin 2', 'Half Full'),
    Data('Bin 3', 'Empty'),
  ];

  List<Data> _filteredData = [];

  @override
  void initState() {
    super.initState();
    setCustomerMarkerIcon();
    _filteredData = _allData;
  }

  void _handleFiltering(List<Data> filteredData) {
    setState(() {
      _filteredData = filteredData;
    });
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

  List<Marker> markerList = [];
  final ref = FirebaseDatabase.instance.ref().child('bin');

  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    setCustomerMarkerIcon();
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: FloatingActionButton(
              onPressed: () =>
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40))),
                    backgroundColor: WHITE,
                    context: context,
                    builder: (context) =>
                        FilteringOptionsWidget(
                          selected: true,
                          ontap: () {},
                          data: _allData,
                          onFilter: _handleFiltering,
                        ),
                  ),
              child: Image.asset(
                FILTRING_ICON,
                height: context.height * 0.05,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () =>
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      //padding: EdgeInsets.all(45.0),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 65.0,
                            //top: 5.0,
                            right: 10.0,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset(
                                CLOSE_BUTTON,
                                height: context.height * 0.05,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 18.0,
                            right: 70.0,
                            child: Material(
                              elevation: 4.0,
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              child: IconButton(
                                onPressed: () {
                                  // Do something when the new button is pressed
                                },
                                icon: Image.asset(
                                  NAVIGATION_BUTTON,
                                  height: context.height * 0.09,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 120.0),
                              // Other widgets here
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
            child: Image.asset(
              NAVIGATION_BUTTON,
              height: context.height * 0.05,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: ref.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                Map<dynamic, dynamic> map = snapshot.data!.snapshot
                    .value as dynamic;
                List<dynamic> list = [];
                list.clear();
                list = map.values.toList();

                //createMarkers(list);

                print('Wed Wed Wed Wed Wed Wed Wed Wed $list');

                return GoogleMap(
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target: _initialPosition, zoom: 13),
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
            }
        ),
      ),
    );
  }
  }
