import 'package:equatable/equatable.dart';

/*class AdminMapDriver extends Equatable {
  final String fullName;
  final String image;
  final double lat;
  final double lng;
  final String area;

  const AdminMapDriver({
    required this.fullName,
    required this.image,
    required this.lat,
    required this.lng,
    required this.area,
  });
  @override
  List<Object?> get props => [
        fullName,
        image,
        lat,
        lng,
        area,
      ];
}*/

abstract class AdminMapDriver extends Equatable {
  final String fullName;
  final String image;
  final double lat;
  final double lng;
  final String area;

  const AdminMapDriver({
    required this.fullName,
    required this.image,
    required this.lat,
    required this.lng,
    required this.area,
  });
  @override
  List<Object?> get props => [
        fullName,
        image,
        lat,
        lng,
        area,
      ];
}
