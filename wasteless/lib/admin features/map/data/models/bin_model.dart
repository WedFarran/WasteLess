import '../../domain/entities/bin_entity.dart';

class BinModel extends Bin {
  const BinModel(
      {required super.id,
      required super.status,
      required super.lat,
      required super.lng,
      required super.wasteLevel,
      required super.fullnesTime});

  factory BinModel.fromJson(Map<String, dynamic> json) {
    return BinModel(
        id: json['id'],
        status: json['status'],
        lat: json['lat'],
        lng: json['lng'],
        wasteLevel: json['wasteLevel'],
        fullnesTime: json['fullnesTime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'lat': lat,
      'lng': lng,
      'wasteLevel': wasteLevel,
      'fullnesTime': fullnesTime
    };
  }
}
