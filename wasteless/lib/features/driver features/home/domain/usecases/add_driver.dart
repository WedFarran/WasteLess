import 'package:dartz/dartz.dart';
import '../../../../../core/common/entity/driver_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/driver_repos.dart';

class AddDriverUsecases {
  final DriverRepos driver;

  AddDriverUsecases(this.driver);

  Future<Either<Failure, Unit>> call(DriverEntity deleteId) async {
    return await driver.addDriver(deleteId);
  }
}
