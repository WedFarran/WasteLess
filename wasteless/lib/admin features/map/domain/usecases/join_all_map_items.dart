import 'package:dartz/dartz.dart';
import 'package:wasteless/admin%20features/map/domain/repos/map_repo.dart';

import '../../../../core/errors/failure.dart';

class GetAllMapItemsUsecase {
  final MapRepo mapRepo;

  GetAllMapItemsUsecase(this.mapRepo);

  Future<Either<Failure, List>> call() async {
    return await mapRepo.getAllMapItems();
  }
}
