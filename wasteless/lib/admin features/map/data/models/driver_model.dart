import '../../domain/entities/driver_entity.dart';

class MapDriverModel extends MapDriver {
  const MapDriverModel({
    required super.id,
    required super.fullName,
    required super.image,
    required super.lat,
    required super.lng,
    required super.area,
  });

  factory MapDriverModel.fromJson(Map<String, dynamic> json) {
    return MapDriverModel(
      id: json['id'],
      fullName: json['fullName'],
      image: json['image'],
      lat: json['lat'],
      lng: json['lng'],
      area: json['area'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'image': image,
      'lat': lat,
      'lng': lng,
      'area': area,
    };
  }
}
