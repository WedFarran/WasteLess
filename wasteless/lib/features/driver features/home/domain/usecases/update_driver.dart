import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/driver.dart';
import '../repos/driver_repos.dart';

class UpdateDriverUsecases {
  final DriverRepos driver;

  UpdateDriverUsecases(this.driver);

  Future<Either<Failure, Unit>> call(DriverEntity driverEntity) async {
    return await driver.UpdateDriver(driverEntity);
  }
}
