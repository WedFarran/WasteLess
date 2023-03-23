import 'package:dartz/dartz.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/bin_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/driver_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/map_repo.dart';

class GetAllAdminMapItemsUsecase {
  final MapRepo mapRepo;

  GetAllAdminMapItemsUsecase(this.mapRepo);

  Future<
          Either<Failure,
              Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>>
      call() async {
    return await mapRepo.getAllMapItems();
  }
}
