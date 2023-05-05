import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/features/admin%20features/map/data/models/bins_models.dart';
import 'package:wasteless/features/admin%20features/map/data/models/driver_models.dart';
import 'package:wasteless/features/admin%20features/map/presentation/widgets/driver_details_widget.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/map_widgets/bin_details.dart';
//import '../../driver features/map/data/models/driver_map_model.dart';
//import '../data/models/bins_models.dart';
//import 'widgets/driver_details_widget.dart';

BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor brokenBinMarker = BitmapDescriptor.defaultMarker;

List markerList = [];

setCustomeMarkerIcon() {
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN)
      .then((icon) => {fullBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, VEHICLE_ICON)
      .then((icon) => {driverMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, HALF_FULL_BIN_PIN)
      .then((icon) => {halfFullBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, EMPTY_BIN_PIN)
      .then((icon) => {emptyBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, BROKEN_BIN_ICON)
      .then((icon) => {brokenBinMarker = icon});
}

getGeoCords(
    List<BinsModel> binsList,
    BuildContext context,
    List<DriversModel> driversList,
    bool fullSelected,
    bool halfFullSelected,
    bool emptySelected,
    bool driversSelected) {
  List<Marker> binsMarkers = [];
  List<Marker> driversMarkers = [];
  List<Marker> markersList = [];

  binsMarkers = binsList
      .map((e) => Marker(
    markerId: MarkerId(e.id),
    icon: e.status == true
        ? e.wasteLevel < 0.4
        ? emptyBinMarker
        : e.wasteLevel >= 0.8
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
          percent: e.wasteLevel,
          location: 'Abdullah Arif st',
          fullnesTime: e.fullnesTime,
        )),
    position: LatLng(e.lat, e.lng),
  ))
      .toList();
  driversMarkers = driversList
      .map((e) => Marker(
    markerId: MarkerId(e.id),
    icon: driverMarker,
    onTap: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(40))),
        backgroundColor: WHITE,
        context: context,
        builder: (context) => DriverDetailsWidget(
          location: '',
          name: e.fullName,
        )),
    position: LatLng(e.lat, e.lng),
  ))
      .toList();
  if (fullSelected) {
    markersList
        .addAll(binsMarkers.where((element) => element.icon == fullBinMarker));
  }
  if (halfFullSelected) {
    markersList.addAll(
        binsMarkers.where((element) => element.icon == halfFullBinMarker));
  }
  if (emptySelected) {
    markersList
        .addAll(binsMarkers.where((element) => element.icon == emptyBinMarker));
  }
  // markersList.addAll(binsMarkers);

  driversSelected ? markersList.addAll(driversMarkers) : null;
  return markersList;
}