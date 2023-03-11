import '../../domain/entities/driver_entity.dart';

class DriverModel extends Driver {
  const DriverModel(
      {required super.id,
      required super.fullName,
      required super.email,
      required super.image,
      required super.lat,
      required super.lng,
      required super.phoneNumber,
      required super.idNumber,
      required super.area,
      required super.nationality,
      required super.qR});

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      image: json['image'],
      lat: json['lat'],
      lng: json['lng'],
      phoneNumber: json['phoneNumber'],
      idNumber: json['idNumber'],
      area: json['area'],
      nationality: json['nationality'],
      qR: json['qR'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'image': image,
      'lat': lat,
      'lng': lng,
      'phoneNumber': phoneNumber,
      'idNumber': idNumber,
      'area': area,
      'nationality': nationality,
      'qR': qR
    };
  }
}
