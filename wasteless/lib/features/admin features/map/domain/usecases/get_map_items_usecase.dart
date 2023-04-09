import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/failure.dart';
import '../repo/map_items_repo.dart';

class GetAllAdminMapItemsUseCase {
  final MapItemsRepo _mapItemsRepo;
  GetAllAdminMapItemsUseCase(this._mapItemsRepo);
  Future<Either<Failure, Map<String, dynamic>>>? call() async {
    return await _mapItemsRepo.getAllMapItems();
  }
}
