import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/map_repo.dart';

class GetAllAdminMapItemsUsecase {
  final MapRepo mapRepo;

  GetAllAdminMapItemsUsecase(this.mapRepo);

  Future<Either<Failure, Map<String, dynamic>>> call() async {
    return await mapRepo.getAllMapItems();
  }
}
