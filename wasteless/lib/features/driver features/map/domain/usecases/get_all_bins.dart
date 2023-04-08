import 'package:dartz/dartz.dart';
import 'package:wasteless/features/driver%20features/map/domain/entities/driver_map.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/driver_map_repos.dart';

class GetAllBinsUsecase{
  final DriverMapRepos repository;

  GetAllBinsUsecase(this.repository);
//async because it's future
  Future<Either<Failure, List<DriverMap>>> call() async{
    return await repository.getAllBins();
  }

}