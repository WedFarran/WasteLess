import 'package:equatable/equatable.dart';

abstract class AdminMapBin extends Equatable {
  final String fullnesTime;
  final double lat;
  final double lng;
  final bool status;
  final double wasteLevel;

  const AdminMapBin({
    required this.fullnesTime,
    required this.lat,
    required this.lng,
    required this.status,
    required this.wasteLevel,
  });
  @override
  List<Object?> get props => [fullnesTime, lat, lng, status, wasteLevel];
}
