import 'package:dartz/dartz.dart';
import 'package:wasteless/admin%20features/map/domain/repos/map_repo.dart';

import '../../../../core/errors/failure.dart';

class FilterMapItems {
  final MapRepo mapRepo;

  FilterMapItems(this.mapRepo);

  Future<Either<Failure, List>> call(List filterdItems) async {
    return await mapRepo.filterMapItems(filterdItems);
  }
}
