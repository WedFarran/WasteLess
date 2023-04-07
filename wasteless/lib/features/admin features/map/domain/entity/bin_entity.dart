import 'package:equatable/equatable.dart';

class BinEntity extends Equatable {
  final String id;
  final String fullnesTime;
  final double lat;
  final double lng;
  final bool statues;
  final int wasteLevel;

  const BinEntity(
      {required this.id,
      required this.fullnesTime,
      required this.lat,
      required this.lng,
      required this.statues,
      required this.wasteLevel});
  @override
  List<Object?> get props => throw UnimplementedError();
}
