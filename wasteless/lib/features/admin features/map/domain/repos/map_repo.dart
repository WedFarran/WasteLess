import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MapRepo {
  // i wanted to specify the types of dynamic but i dont know how to do it
  Future<Either<Failure, Map<String, dynamic>>> getAllMapItems();
  /*Future<Either<Failure, List<AdminMapBin>>> getAllMapBins();
  Future<Either<Failure, List<AdminMapDriver>>> getAllMapDrivers();*/
}
