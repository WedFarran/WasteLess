import 'package:equatable/equatable.dart';

class MapDriver extends Equatable {
  final int id;
  final String fullName;
  final String image;
  final double lat;
  final double lng;
  final String area;

  const MapDriver({
    required this.id,
    required this.fullName,
    required this.image,
    required this.lat,
    required this.lng,
    required this.area,
  });
  @override
  List<Object?> get props => [
        id,
        fullName,
        image,
        lat,
        lng,
        area,
      ];
}
