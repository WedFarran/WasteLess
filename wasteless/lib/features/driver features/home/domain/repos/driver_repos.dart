import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/failure.dart';

import '../../../../../core/common/domain/entity/driver_entity.dart';

abstract class DriverRepos {
  Future<Either<Failure, List<DriverEntity>>> getAllDriver();
  Future<Either<Failure, Unit>> deleteDriver(int id);
  // ignore: non_constant_identifier_names
  Future<Either<Failure, Unit>> UpdateDriver(DriverEntity driverEntity);
  Future<Either<Failure, Unit>> addDriver(DriverEntity driverEntity);
}
///return Left(NotInternetFailure());
///return Right(void);
