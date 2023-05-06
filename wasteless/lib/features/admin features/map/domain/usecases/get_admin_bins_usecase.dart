import 'package:dartz/dartz.dart';
import '../../../../../core/entity/bin_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/map_items_repo.dart';

class GetAllAdminMapBinsUseCase {
  final MapItemsRepo _mapItemsRepo;
  GetAllAdminMapBinsUseCase(this._mapItemsRepo);
  Future<Either<Failure, List<BinEntity>>>? call() async {
    return await _mapItemsRepo.getAllMapBins();
  }
}
