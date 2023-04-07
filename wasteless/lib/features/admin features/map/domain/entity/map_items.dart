import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wasteless/features/admin%20features/map/domain/entity/bin_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entity/driver_entity.dart';

class AdminMapItemsEntity extends Equatable {
  final Map<String, List<Either<BinEntity, DriverEntity>>> mapItems;

  const AdminMapItemsEntity({required this.mapItems});
  @override
  List<Object?> get props => throw UnimplementedError();
}
