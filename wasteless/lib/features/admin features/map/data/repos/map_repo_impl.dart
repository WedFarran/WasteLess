import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:wasteless/core/network/network_info.dart';

import '../../domain/entities/bin_entity.dart';
import '../../domain/entities/driver_entity.dart';
import '../../domain/repos/map_repo.dart';
import '../datasources/map_local_data_source.dart';
import '../datasources/map_remote_data_source.dart';

class MapRepoImpl implements MapRepo {
  final MapRemoteDataSource remoteDataSource;
  final MapLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  MapRepoImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<MapBin>>> getAllMapBins() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMapBins = await remoteDataSource.getAllMapBins();
        localDataSource.cacheMapBins(remoteMapBins);
        return Right(remoteMapBins);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMapBins = await localDataSource.getCachedMapBins();
        return Right(localMapBins);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MapDriver>>> getAllMapDrivers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMapDrivers = await remoteDataSource.getAllMapDrivers();
        localDataSource.cacheMapDrivers(remoteMapDrivers);
        return Right(remoteMapDrivers);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMapDrivers = await localDataSource.getCachedMapDrivers();
        return Right(localMapDrivers);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
