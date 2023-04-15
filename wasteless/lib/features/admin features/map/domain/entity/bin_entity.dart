import 'package:equatable/equatable.dart';

class BinEntity extends Equatable {
  final String id;
  final String fullnesTime;
  final double lat;
  final double lng;
  final bool status;
  final double wasteLevel;

  const BinEntity(
      {required this.id,
      required this.fullnesTime,
      required this.lat,
      required this.lng,
      required this.status,
      required this.wasteLevel});
  @override
  List<Object?> get props => [id, fullnesTime, lat, lng, status, wasteLevel];
}
