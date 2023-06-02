import '../../../../../core/common/domain/entity/bin.dart';
import '../repo/map_items_repo.dart';

class GetAllAdminMapBinsUseCase {
  final MapItemsRepo _mapItemsRepo;
  GetAllAdminMapBinsUseCase(this._mapItemsRepo);
  List<BinEntity> call() {
    return _mapItemsRepo.getAllMapBins();
  }
}
