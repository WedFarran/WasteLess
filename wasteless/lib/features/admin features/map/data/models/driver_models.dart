import 'package:wasteless/features/admin%20features/map/domain/entity/driver_entity.dart';

class DriversModel extends DriverEntity {
  const DriversModel(
      {required super.id,
      required super.area,
      required super.email,
      required super.fullName,
      required super.idNumber,
      required super.image,
      required super.lat,
      required super.lng,
      required super.nationality,
      required super.qR});
  factory DriversModel.fromMap(Map<dynamic, dynamic> map) {
    return DriversModel(
      id: map['id'] ?? '',
      area: map['area'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      idNumber: map['idNumber'] ?? '',
      image: map['image'] ?? '',
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
      nationality: map['nationality'] ?? '',
      qR: map['qR'] ?? '',
    );
  }
  factory DriversModel.fromJson(Map<String, dynamic> json) {
    return DriversModel(
        id: json['id'],
        area: json['area'],
        email: json['email'],
        fullName: json['fullName'],
        idNumber: json['idNumber'],
        image: json['image'],
        lat: json['lat'],
        lng: json['lng'],
        nationality: json['nationality'],
        qR: json['qR']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'area': area,
      'email': email,
      'fullName': fullName,
      'idNumber': idNumber,
      'image': image,
      'lat': lat,
      'lng': lng,
      'nationality': nationality,
      'qR': qR,
    };
  }
}
