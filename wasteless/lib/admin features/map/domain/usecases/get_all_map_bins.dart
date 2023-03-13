import 'package:dartz/dartz.dart';
import 'package:wasteless/admin%20features/map/domain/repos/map_repo.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bin_entity.dart';

class GetAllMapBinsUsecase {
  final MapRepo mapRepo;

  GetAllMapBinsUsecase(this.mapRepo);

  Future<Either<Failure, List<MapBin>>> call() async {
    return await mapRepo.getAllMapBins();
  }
}
