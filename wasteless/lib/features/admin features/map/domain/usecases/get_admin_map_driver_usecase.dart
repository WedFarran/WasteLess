import '../../../../../core/entity/driver_entity.dart';
import '../repo/map_items_repo.dart';

class GetAllAdminMapDriversUseCase {
  final MapItemsRepo _mapItemsRepo;
  GetAllAdminMapDriversUseCase(this._mapItemsRepo);
  List<DriverEntity> call() {
    return _mapItemsRepo.getAllMapDrivers();
  }
}
