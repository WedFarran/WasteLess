import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/driver_entity.dart';
import '../repos/map_repo.dart';

class GetAllMapDriversUsecase {
  final MapRepo mapRepo;

  GetAllMapDriversUsecase(this.mapRepo);

  Future<Either<Failure, List<MapDriver>>> call() async {
    return await mapRepo.getAllMapDrivers();
  }
}
