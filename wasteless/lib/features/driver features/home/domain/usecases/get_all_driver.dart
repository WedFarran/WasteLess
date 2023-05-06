import 'package:dartz/dartz.dart';
import '../../../../../core/common/domain/entity/driver_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/driver_repos.dart';

class GetAllDriverUsecases {
  final DriverRepos driver;

  GetAllDriverUsecases(this.driver);

  Future<Either<Failure, List<DriverEntity>>> call() async {
    return await driver.getAllDriver();
  }
}
