import 'package:equatable/equatable.dart';

class Bin extends Equatable {
  final int id;
  final double status;
  final double lat;
  final double lng;
  final double wasteLevel;
  final String fullnesTime;

  const Bin(
      {required this.id,
      required this.status,
      required this.lat,
      required this.lng,
      required this.wasteLevel,
      required this.fullnesTime});
  @override
  List<Object?> get props => [id, status, lat, lng, fullnesTime];
}
