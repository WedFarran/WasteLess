import 'package:equatable/equatable.dart';

class DriverEntity extends Equatable {
  final String id;
  final String area;
  final String email;
  final String fullName;
  final int idNumber;
  final String image;
  final double lat;
  final double lng;
  final String nationality;
  final String qR;

  const DriverEntity(
      {required this.id,
      required this.area,
      required this.email,
      required this.fullName,
      required this.idNumber,
      required this.image,
      required this.lat,
      required this.lng,
      required this.nationality,
      required this.qR});
  @override
  List<Object?> get props => throw UnimplementedError();
}
