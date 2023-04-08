import 'package:wasteless/features/driver%20features/map/domain/entities/driver_map.dart';

class DriverMapModel extends DriverMap {
  const DriverMapModel(
      {required super.binId,
      required super.status,
      required super.lat,
      required super.lng,
      required super.location,
      required super.fullnesTime,
      required super.wasteLevel});

  factory DriverMapModel.fromJson(Map<String, dynamic> json) {
    return DriverMapModel(
        binId: json['binId'],
        status: json['status'],
        lat: json['lat'],
        lng: json['lng'],
        location: json['location'],
        fullnesTime: json['fullnesTime'],
        wasteLevel: json['wasteLevel']);
  }

  Map<String, dynamic> toJson() {
    return {
      'binId': binId,
      'status': status,
      'location': location,
      'fullnesTime': fullnesTime,
      'wasteLevel': wasteLevel
    };
  }
}
