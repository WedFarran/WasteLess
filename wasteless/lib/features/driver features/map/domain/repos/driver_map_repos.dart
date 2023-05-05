import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/failure.dart';

import '../entities/driver_map.dart';

abstract class DriverMapRepos {
  //These methods it return either a failure(something error in the app or Unit
  Future<Either<Failure,List<DriverMap>>> getAllBins();
  //Future<Either<Failure,List<DriverMap>>> shortestRoute(DriverMap bins);
  //Future<Either<Failure,Unit>> prediction(binId);
  //Future<Either<Failure,Unit>> report(String reportForm);
}