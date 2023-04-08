import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DriverMap extends Equatable {
  final Int binId;
  final Double status;
  final Double lat;
  final Double lng;
  final String location;
  final String fullnesTime;
  final Double wasteLevel;

  const DriverMap({
      required this.binId,
      required this.status,
      required this.lat,
      required this.lng,
      required this.location,
      required this.fullnesTime,
      required this.wasteLevel,
  });

  @override
  List<Object?> get props => [binId, status, lat, lng, location, fullnesTime, wasteLevel];
}
