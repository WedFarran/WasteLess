import 'package:dartz/dartz.dart';
import '../../../../../core/common/domain/entity/driver_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/driver_repos.dart';

class UpdateDriverUsecases {
  final DriverRepos driver;

  UpdateDriverUsecases(this.driver);

  Future<Either<Failure, Unit>> call(DriverEntity driverEntity) async {
    return await driver.UpdateDriver(driverEntity);
  }
}
