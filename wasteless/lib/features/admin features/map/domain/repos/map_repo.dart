import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/bin_entity.dart';
import '../entities/driver_entity.dart';

abstract class MapRepo {
  Future<Either<Failure, List<AdminMapBin>>> getAllMapBins();
  Future<Either<Failure, List<AdminMapDriver>>> getAllMapDrivers();
}
