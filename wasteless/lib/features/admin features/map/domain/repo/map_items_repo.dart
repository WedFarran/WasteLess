import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/failure.dart';

import '../entity/bin_entity.dart';
import '../entity/driver_entity.dart';

abstract class MapItemsRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllMapItems();
  Future<Either<Failure, List<BinEntity>>> getAllMapBins();
  Future<Either<Failure, List<DriverEntity>>> getAllMapDrivers();
}
