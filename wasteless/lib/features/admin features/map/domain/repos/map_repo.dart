import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/driver_entity.dart';

import '../entities/bin_entity.dart';

abstract class MapRepo {
  // i wanted to specify the types of dynamic but i dont know how to do it
  Future<
          Either<Failure,
              Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>>
      getAllMapItems();
}
