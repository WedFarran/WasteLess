import 'package:dartz/dartz.dart';
import '../../../../../core/entity/driver_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/map_items_repo.dart';

class GetAllAdminMapDriversUseCase {
  final MapItemsRepo _mapItemsRepo;
  GetAllAdminMapDriversUseCase(this._mapItemsRepo);
  Future<Either<Failure, List<DriverEntity>>>? call() async {
    return await _mapItemsRepo.getAllMapDrivers();
  }
}
