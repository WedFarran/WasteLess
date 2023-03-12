import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repos/map_repo.dart';

class GetAllMapDriversUsecase {
  final MapRepo mapRepo;

  GetAllMapDriversUsecase(this.mapRepo);

  Future<Either<Failure, List>> call() async {
    return await mapRepo.getAllMapDrivers();
  }
}
