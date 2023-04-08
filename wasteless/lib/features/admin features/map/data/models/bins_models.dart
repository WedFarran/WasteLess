import 'package:wasteless/features/admin%20features/map/domain/entity/bin_entity.dart';

class BinsModel extends BinEntity {
  BinsModel(
      {required String id,
      required String fullnesTime,
      required double lat,
      required double lng,
      required bool statues,
      required double wasteLevel})
      : super(
            id: id,
            fullnesTime: fullnesTime,
            lat: lat,
            lng: lng,
            statues: statues,
            wasteLevel: wasteLevel);

  factory BinsModel.fromJson(Map<String, dynamic> json) {
    return BinsModel(
        id: json['id'],
        fullnesTime: json['fullnesTime'],
        lat: json['lat'],
        lng: json['lng'],
        statues: json['statues'],
        wasteLevel: json['wasteLevel']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullnesTime': fullnesTime,
      'lat': lat,
      'lng': lng,
      'statues': statues,
      'wasteLevel': wasteLevel
    };
  }
}
