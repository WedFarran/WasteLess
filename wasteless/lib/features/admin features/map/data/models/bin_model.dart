import '../../domain/entities/bin_entity.dart';

class MapBinModel extends MapBin {
  const MapBinModel(
      {required super.id,
      required super.status,
      required super.lat,
      required super.lng,
      required super.wasteLevel,
      required super.fullnesTime});

  factory MapBinModel.fromJson(Map<String, dynamic> json) {
    return MapBinModel(
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
