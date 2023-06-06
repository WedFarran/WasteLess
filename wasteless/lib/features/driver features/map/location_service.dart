import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../core/common/data/models/bins_models.dart';
import '../../../core/utils/assets_path.dart';
import '../../../core/utils/colors.dart';
import '../../../core/widgets/map_widgets/bin_details.dart';

BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
BitmapDescriptor brokeBinMarker = BitmapDescriptor.defaultMarker;
setCustomeMarkerIcon() {
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN)
      .then((icon) => {fullBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, EMPTY_BIN_PIN)
      .then((icon) => {driverMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, HALF_FULL_BIN_PIN)
      .then((icon) => {halfFullBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, BROKIN_BIN_PIN)
      .then((icon) => {brokeBinMarker = icon});
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, EMPTY_BIN_PIN)
      .then((icon) => {emptyBinMarker = icon});
}

String url = 'https://maps.googleapis.com/maps/api/directions/json?';

Future<Map<String, dynamic>> getDirections(
    String origin, List<BinsAndDistances> distances) async {
  distances.sort((a, b) => a.distance.compareTo(b.distance));
  String distination =
      '${distances[distances.length - 1].lat},${distances[distances.length - 1].lng}';
  List<String> waypoints = distances
      .sublist(1, distances.length - 1)
      .map((waypoint) => "${waypoint.lat},${waypoint.lng}")
      .toList();
  url =
      'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$distination&waypoints=${waypoints.join("|")}&optimizeWaypoints=true&key=AIzaSyAQTWJhj_pcAowPjOr_4ZUVb03JiozOyCo';

  var response = await http.get(Uri.parse(url));
  var jsonb = json.decode(response.body);
  var results = {
    'bounds_ne': jsonb['routes'][0]['bounds']['northeast'],
    'bounds_sw': jsonb['routes'][0]['bounds']['southwest'],
    'start_location': jsonb['routes'][0]['legs'][0]['start_location'],
    'end_location': jsonb['routes'][0]['legs'][0]['end_location'],
    'polyline': jsonb['routes'][0]['overview_polyline']['points'],
    'polyline_decoded': PolylinePoints()
        .decodePolyline(jsonb['routes'][0]['overview_polyline']['points']),
  };
  return results;
}

double calculateDistances(LatLng start, LatLng end) {
  const double earthRadius = 6371.0; // Radius of the Earth in kilometers

  // Convert coordinates to radians
  final double lat1 = start.latitude * (pi / 180.0);
  final double lon1 = start.longitude * (pi / 180.0);
  final double lat2 = end.latitude * (pi / 180.0);
  final double lon2 = end.longitude * (pi / 180.0);

  // Calculate the differences between the coordinates
  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;

  // Apply the Haversine formula
  final double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  final double distance = earthRadius * c;

  return distance; // Distance in kilometers, add "*1000" to get meters
}

class BinsAndDistances {
  final double distance;
  final double lat;
  final double lng;
  BinsAndDistances(
      {required this.distance, required this.lat, required this.lng});
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
          markerId: e.wasteLevel < 0.4
              ? MarkerId('empty ${e.id}')
              : e.wasteLevel >= 0.8
                  ? MarkerId('full ${e.id}')
                  : MarkerId('half ${e.id}'),
          icon: e.status == true
              ? e.wasteLevel < 0.4
                  ? driverMarker
                  : e.wasteLevel >= 0.8
                      ? fullBinMarker
                      : halfFullBinMarker
              : brokeBinMarker,
          onTap: () async {
            List<Placemark> placemarks =
                await placemarkFromCoordinates(e.lat, e.lng);
            // ignore: use_build_context_synchronously
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
    markersList.addAll(binsMarkers
        .where((element) => element.markerId.value.contains('full')));
  }
  if (halfFullSelected) {
    markersList.addAll(binsMarkers
        .where((element) => element.markerId.value.contains('half')));
  }
  if (emptySelected) {
    markersList.addAll(binsMarkers
        .where((element) => element.markerId.value.contains('empty')));
  }

  return markersList;
}
