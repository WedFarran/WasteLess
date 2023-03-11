import 'package:equatable/equatable.dart';

class Driver extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String image;
  final double lat;
  final double lng;
  final int phoneNumber;
  final int idNumber;
  final String area;
  final String nationality;
  final String qR;

  const Driver(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.image,
      required this.lat,
      required this.lng,
      required this.phoneNumber,
      required this.idNumber,
      required this.area,
      required this.nationality,
      required this.qR});
  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        image,
        lat,
        lng,
        phoneNumber,
        idNumber,
        area,
        nationality,
        qR
      ];
}
