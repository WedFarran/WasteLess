import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/driver_repos.dart';

class DeleteDriverUsecases {
  final DriverRepos driver;

  DeleteDriverUsecases(this.driver);

  Future<Either<Failure, Unit>> call(int deleteId) async {
    return await driver.deleteDriver(deleteId);
  }
}
