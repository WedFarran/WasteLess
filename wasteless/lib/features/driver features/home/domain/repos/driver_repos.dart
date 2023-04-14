// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/failure.dart';

import '../entities/driver.dart';

abstract class DriverRepos {
  Future<Either<Failure, List<DriverEntity>>> getAllDriver();
  Future<Either<Failure, Unit>> deleteDriver(int id);
  Future<Either<Failure, Unit>> UpdateDriver(DriverEntity driverEntity);
  Future<Either<Failure, Unit>> addDriver(DriverEntity driverEntity);
}
///return Left(NotInternetFailure());
///return Right(void);
