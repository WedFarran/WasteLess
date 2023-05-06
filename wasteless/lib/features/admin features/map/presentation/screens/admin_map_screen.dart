// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../core/model/bins_models.dart';
import '../../../../../core/model/driver_models.dart';
import '../../../../../core/providers/map/filtering_change_notifier.dart';
import '../../../../../core/tools/map_tools.dart';
import '../../../../../core/widgets/map_widgets/filterin_floating_action_button.dart';
import '../widgets/filtering_options_widget.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;
  late DatabaseReference dbBins;
  late DatabaseReference dbDrivers;
  List<BinsModel> binsList = [];
  List<DriversModel> driversList = [];

  final LatLng _initialPosition =
      const LatLng(21.42462845849512, 39.82612550889805);
  final Set<Marker> markers = {};

  @override
  void initState() {
    dbBins = FirebaseDatabase.instance.ref("bin/");
    dbDrivers = FirebaseDatabase.instance.ref("driver");
    setCustomeMarkerIcon();
    getBins();
    getDrivers();
    super.initState();
  }

  getBins() {
    Stream<DatabaseEvent> streamBins = dbBins.onValue;
    streamBins.listen((DatabaseEvent event) {
      Map<String, dynamic> binsMap =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      binsMap.forEach((key, value) {
        binsList.add(BinsModel(
            id: key,
            fullnesTime: value['fullnesTime'],
            wasteLevel: value['wasteLevel'],
            lat: value['lat'],
            lng: value['lng'],
            status: value['status']));
      });
      setState(() {});
    });
  }

  getDrivers() {
    Stream<DatabaseEvent> streamDrivers = dbDrivers.onValue;
    streamDrivers.listen((DatabaseEvent event) {
      Map<String, dynamic> driversMap =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      driversMap.forEach((key, value) {
        driversList.add(DriversModel(
            id: key,
            area: value['area'],
            email: value['email'],
            fullName: value['fullName'],
            idNumber: value['idNumber'],
            image: value['image'],
            lat: value['lat'],
            lng: value['lng'],
            nationality: value['nationality'],
            qR: value['qR']));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const Padding(
            padding: EdgeInsets.only(bottom: 80.0),
            child: FilterinFloatingActionButton(
                widget: AdminMapFilteringOptionsWidget())),
        body: SafeArea(child: Consumer<FilteringChangeNotifier>(
            builder: (context, filteringOptions, child) {
          if (binsList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
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
            markers: Set.from(getAllGeoCords(
                binsList,
                context,
                driversList,
                filteringOptions.fullCheck,
                filteringOptions.halfFullCheck,
                filteringOptions.emptyCheck,
                filteringOptions.driversCheck)),
          );
        })));
  }
}
