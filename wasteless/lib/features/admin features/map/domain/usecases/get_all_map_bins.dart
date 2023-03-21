import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/bin_entity.dart';
import '../repos/map_repo.dart';

class GetAllMapBinsUsecase {
  final MapRepo mapRepo;

  GetAllMapBinsUsecase(this.mapRepo);

  Future<Either<Failure, List<MapBin>>> call() async {
    return await mapRepo.getAllMapBins();
  }
}
