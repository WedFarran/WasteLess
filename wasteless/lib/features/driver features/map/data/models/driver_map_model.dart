import 'package:wasteless/features/driver%20features/map/domain/entities/driver_map.dart';

class BinsModel extends DriverMap {
  const BinsModel(
      {required super.binId,
      required super.status,
      required super.lat,
      required super.lng,
      required super.fullnesTime,
      required super.wasteLevel});

  factory BinsModel.fromJson(Map<String, dynamic> json) {
    return BinsModel(
      binId: json['id'],
      status: json['status'],
      fullnesTime: json['fullnesTime'],
      lat: json['lat'],
      lng: json['lng'],
      wasteLevel: json['wasteLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': binId,
      'fullnesTime': fullnesTime,
      'lat': lat,
      'lng': lng,
      'status': status,
      'wasteLevel': wasteLevel
    };
  }
}
