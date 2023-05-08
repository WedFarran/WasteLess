import 'package:dartz/dartz.dart';
import 'package:wasteless/core/common/domain/entity/driver_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/driver_map_repos.dart';

class GetAllBinsUsecase {
  final DriverMapRepos repository;

  GetAllBinsUsecase(this.repository);
//async because it's future
  Future<Either<Failure, List<DriverEntity>>> call() async {
    return await repository.getAllBins();
  }
}
