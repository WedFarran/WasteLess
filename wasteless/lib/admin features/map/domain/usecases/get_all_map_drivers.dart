import 'package:dartz/dartz.dart';
import 'package:wasteless/admin%20features/map/domain/entities/driver_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repos/map_repo.dart';

class GetAllMapDriversUsecase {
  final MapRepo mapRepo;

  GetAllMapDriversUsecase(this.mapRepo);

  Future<Either<Failure, List<MapDriver>>> call() async {
    return await mapRepo.getAllMapDrivers();
  }
}
