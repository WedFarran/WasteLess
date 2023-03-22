import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/driver_entity.dart';
import '../entities/bin_entity.dart';

abstract class MapRepo {
  //it could return a list of bins or a list of drivers
  /*Future<Either<Failure, List<Either<AdminMapBin, AdminMapDriver>>>>
      getAllAdminMapItems();
  Future<Either<Failure, List<AdminMapItems>>> getAllAdminMapItems();*/
  Future<Either<Failure, List<AdminMapBin>>> getAllAdminMapBins();
  Future<Either<Failure, List<AdminMapDriver>>> getAllAdminMapDrivers();
}
