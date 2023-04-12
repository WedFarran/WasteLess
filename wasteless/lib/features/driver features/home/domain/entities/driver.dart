import 'package:equatable/equatable.dart';

class DriverEntity extends Equatable {
  final int id;
  final String password;
  final String fullName;
  final String email;
  final String qr;
  final String lmage;
  final String location;
  final int phone;
  final String department;
  final int driverId;
  final String area;
  final String nationality;

  const DriverEntity(
      {required this.id,
      required this.password,
      required this.fullName,
      required this.email,
      required this.qr,
      required this.lmage,
      required this.location,
      required this.phone,
      required this.department,
      required this.driverId,
      required this.area,
      required this.nationality});

  @override
  List<Object?> get props => [
        id,
        password,
        fullName,
        email,
        qr,
        lmage,
        location,
        phone,
        department,
        driverId,
        area,
        nationality
      ];
}
