import 'dart:convert';
import 'dart:math';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
