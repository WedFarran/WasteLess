// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/features/admin%20features/map/presentation/widgets/driver_details_widget.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/map_widgets/bin_details.dart';
import '../common/data/models/bins_models.dart';
import '../common/data/models/driver_models.dart';

BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor brokeBinMarker = BitmapDescriptor.defaultMarker;
//TODO: fix the empty pin marker
setCustomeMarkerIcon() {
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN)
      .then((icon) => {fullBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, VEHICLE_ICON)
      .then((icon) => {driverMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, HALF_FULL_BIN_PIN)
      .then((icon) => {halfFullBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, BROKIN_BIN_PIN)
      .then((icon) => {brokeBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, EMPTY_BIN_PIN)
      .then((icon) => {emptyBinMarker = icon});
}

Future<Position> getCurrentLocation() async {
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
    return Future.error('location P are permanently denied ');
  }

  return Geolocator.getCurrentPosition();
}

getAllGeoCords(
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
                : brokeBinMarker,
            onTap: () async {
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(e.lat, e.lng);
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  backgroundColor: WHITE,
                  context: context,
                  builder: (context) => BinDetailsWidget(
                        percent: e.wasteLevel,
                        location: placemarks.reversed.last.street.toString(),
                        fullnesTime: e.fullnesTime,
                      ));
            },
            position: LatLng(e.lat, e.lng),
          ))
      .toList();
  driversMarkers = driversList
      .map((e) => Marker(
            markerId: MarkerId(e.id),
            icon: driverMarker,
            onTap: () async {
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(e.lat, e.lng);
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  backgroundColor: WHITE,
                  context: context,
                  builder: (context) => DriverDetailsWidget(
                        location: placemarks.reversed.last.street.toString(),
                        name: e.fullName,
                        image: e.image,
                      ));
            },
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
        .addAll(binsMarkers.where((element) => element.icon == brokeBinMarker));
  }

  driversSelected ? markersList.addAll(driversMarkers) : null;
  return markersList;
}

getBinsGeoCords(
  List<BinsModel> binsList,
  BuildContext context,
  bool fullSelected,
  bool halfFullSelected,
  bool emptySelected,
) {
  List<Marker> binsMarkers = [];
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
              : brokeBinMarker,
          onTap: () async {
            List<Placemark> placemarks =
                await placemarkFromCoordinates(e.lat, e.lng);
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                backgroundColor: WHITE,
                context: context,
                builder: (context) => BinDetailsWidget(
                    percent: e.wasteLevel,
                    location: placemarks.reversed.last.street.toString(),
                    fullnesTime: e.fullnesTime));
          },
          position: LatLng(e.lat, e.lng)))
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
        .addAll(binsMarkers.where((element) => element.icon == brokeBinMarker));
  }

  return markersList;
}
