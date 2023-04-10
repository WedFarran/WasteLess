import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/map_widgets/bin_details.dart';

BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor brokenBinMarker = BitmapDescriptor.defaultMarker;

List markerList = [];

/*filtermarkers(){

} */
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

getGeoCords(list, BuildContext context, emptyBinMarker, fullBinMarker,
    halfFullBinMarker, brokenBinMarker) {
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
  markerList = markersList;

  return markersList;
}
