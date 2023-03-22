import '../../domain/entities/bin_entity.dart';

class AdminMapBinModel extends AdminMapBin {
  const AdminMapBinModel(
      {required super.status,
      required super.lat,
      required super.lng,
      required super.wasteLevel,
      required super.fullnesTime});

  factory AdminMapBinModel.fromJson(Map<String, dynamic> json) {
    return AdminMapBinModel(
        status: json['status'],
        lat: json['lat'],
        lng: json['lng'],
        wasteLevel: json['wasteLevel'],
        fullnesTime: json['fullnesTime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'lat': lat,
      'lng': lng,
      'wasteLevel': wasteLevel,
      'fullnesTime': fullnesTime
    };
  }
}
