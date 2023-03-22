import '../../domain/entities/driver_entity.dart';

class AdminMapDriverModel extends AdminMapDriver {
  const AdminMapDriverModel({
    required super.fullName,
    required super.image,
    required super.lat,
    required super.lng,
    required super.area,
  });

  factory AdminMapDriverModel.fromJson(Map<String, dynamic> json) {
    return AdminMapDriverModel(
      fullName: json['fullName'],
      image: json['image'],
      lat: json['lat'],
      lng: json['lng'],
      area: json['area'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'image': image,
      'lat': lat,
      'lng': lng,
      'area': area,
    };
  }
}
