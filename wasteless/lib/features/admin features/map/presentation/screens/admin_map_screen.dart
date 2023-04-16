import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/widgets/map_widgets/circle_indicator.dart';
import 'package:wasteless/features/admin%20features/map/presentation/bloc/map_items_bloc.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';
import '../widgets/driver_details_widget.dart';
import '../widgets/filtering_options_widget.dart';
import 'package:http/http.dart' as http;

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;
  double percent = 0.3;

  @override
  void initState() {
    super.initState();
  }

  setCustomeMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN)
        .then((icon) => {binIcon = icon});

    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, VEHICLE_ICON)
        .then((icon) => {driverIcon = icon});
    setState(() {});
  }

  final ref = FirebaseDatabase.instance.ref().child('bin');
  Future init() async {
    final values = await ref.get();
  }

  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  final LatLng _binPosition =
      const LatLng(21.417082915093143, 39.80280324280165);
  final LatLng _driverPosition =
      const LatLng(21.416882224916222, 39.80639877619714);
  BitmapDescriptor binIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor driverIcon = BitmapDescriptor.defaultMarker;

  @override
  Widget build(BuildContext context) {
    setCustomeMarkerIcon();
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
                      ontap: () {}, emptyOnTap: () {  }, fullOnTap: () {  }, halfFullOnTap: () {  }, emptySelected: null,
                    )),
          ),
        ),
        body: BlocBuilder<MapItemsBloc, MapItemsState>(
            builder: ((context, state) {
          if (state is LoadingMapItemsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedMapItemsState) {
            return FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                  title: Text(snapshot.child('wasteLevel').toString()),
                );
              },
            );
          } else if (state is ErrorMapItemsState) {
            return Container(
              alignment: Alignment.center,
              child: const Text('error'),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: const Text('another'),
          );
        })) /*GoogleMap(
          zoomControlsEnabled: false,
          onTap: (argument) {},
          onMapCreated: (controller) {
            mapController = controller;
            mapController.setMapStyle(
                '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
            // mapThings(0.9);
          },
          initialCameraPosition:
              CameraPosition(target: _initialPosition, zoom: 13),
          markers: {
            Marker(
              markerId: const MarkerId('bin'),
              position: _binPosition,
              icon: binIcon,
              onTap: () => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  backgroundColor: WHITE,
                  context: context,
                  builder: (context) => BinDetailsWidget(
                        percent: percent,
                        location: 'Abdullah Arif st',
                        fullnesTime: '100% in 1 Hour',
                      )),
            ),
            Marker(
              markerId: const MarkerId('driver'),
              position: _driverPosition,
              icon: driverIcon,
              onTap: () => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  backgroundColor: WHITE,
                  context: context,
                  builder: (context) => const DriverDetailsWidget(
                        name: 'Anwar',
                        location: 'Abdullah Arif st',
                      )),
            )
          },
        )*/
        );
  }
}
