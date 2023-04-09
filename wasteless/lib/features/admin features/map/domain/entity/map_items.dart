import 'package:equatable/equatable.dart';

class AdminMapItemsEntity extends Equatable {
  final Map<String, dynamic> mapItems;

  const AdminMapItemsEntity({required this.mapItems});
  @override
  List<Object?> get props => [mapItems];
}
