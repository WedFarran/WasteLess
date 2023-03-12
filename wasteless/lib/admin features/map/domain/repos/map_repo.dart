import 'package:wasteless/admin%20features/map/domain/entities/driver_entity.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/bin_entity.dart';

abstract class MapRepo {
  Future<Either<Failure, List<MapBin>>> getAllMapBins();
  Future<Either<Failure, List<MapDriver>>> getAllMapDrivers();
}
