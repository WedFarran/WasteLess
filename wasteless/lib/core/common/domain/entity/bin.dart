import 'package:equatable/equatable.dart';

class Bin extends Equatable {
  final String id;
  final String fullnesTime;
  final double lat;
  final double lng;
  final bool status;
  final double wasteLevel;
  final String location;

  const Bin(
      {required this.id,
      required this.fullnesTime,
      required this.lat,
      required this.lng,
      required this.status,
      required this.wasteLevel,
      required this.location});
  @override
  List<Object?> get props =>
      [id, fullnesTime, lat, lng, status, wasteLevel, location];
}
