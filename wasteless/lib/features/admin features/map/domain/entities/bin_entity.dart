import 'package:equatable/equatable.dart';

class MapBin extends Equatable {
  final int id;
  final bool status;
  final double lat;
  final double lng;
  final double wasteLevel;
  final String fullnesTime;

  const MapBin(
      {required this.id,
      required this.status,
      required this.lat,
      required this.lng,
      required this.wasteLevel,
      required this.fullnesTime});
  @override
  List<Object?> get props => [id, status, lat, lng, fullnesTime];
}
