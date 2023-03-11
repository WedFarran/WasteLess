import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MapRepo {
  Future<Either<Failure, List>> getAllMapItems();
  Future<Either<Failure, List>> filterMapItems(List filterdItems);
  displayDetails(String objectType, Object opject);
}
