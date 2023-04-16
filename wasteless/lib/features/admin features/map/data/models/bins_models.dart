import 'package:wasteless/features/admin%20features/map/domain/entity/bin_entity.dart';

class BinsModel extends BinEntity {
  const BinsModel(
      {required String id,
        required String fullnesTime,
        required double lat,
        required double lng,
        required bool status,
        required double wasteLevel})
      : super(
      id: id,
      fullnesTime: fullnesTime,
      lat: lat,
      lng: lng,
      status: status,
      wasteLevel: wasteLevel);

  factory BinsModel.fromMap(Map<dynamic, dynamic> map) {
    return BinsModel(
      id: map['id'] ?? '',
      fullnesTime: map['fullnesTime'] ?? '',
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
      status: map['status'] ?? false,
      wasteLevel: map['wasteLevel'] ?? '',
    );
  }

  factory BinsModel.fromJson(Map<String, dynamic> json) {
    return BinsModel(
        id: json['id'],
        fullnesTime: json['fullnesTime'],
        lat: json['lat'],
        lng: json['lng'],
        status: json['statues'],
        wasteLevel: json['wasteLevel']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullnesTime': fullnesTime,
      'lat': lat,
      'lng': lng,
      'statues': status,
      'wasteLevel': wasteLevel
    };
  }
}
