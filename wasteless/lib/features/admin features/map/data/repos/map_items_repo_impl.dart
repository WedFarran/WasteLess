import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/network/network_info.dart';
import 'package:wasteless/features/admin%20features/map/domain/entity/driver_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entity/bin_entity.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repo/map_items_repo.dart';
import '../datasources/map_items_local_data_source.dart';
import '../datasources/map_items_remote_data_source.dart';

class MapItemsRepoImpl implements MapItemsRepo {
  final MapItemsRemoteDataSource remoteDataSource;
  final MapItemsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  MapItemsRepoImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<BinEntity>>> getAllMapBins() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMapBins = await remoteDataSource.getAllMapBins();
        return Right(remoteMapBins);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<DriverEntity>>> getAllMapDrivers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMapDrivers = await remoteDataSource.getAllMapDrivers();
        return Right(remoteMapDrivers);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllMapItems() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMapBins = await getAllMapBins();
        final remoteMapDrivers = await getAllMapDrivers();
        Map<String, dynamic> mapItems = {};
        remoteMapBins.fold(
            (failure) => Left(ServerFailure()),
            (mapBins) => remoteMapDrivers.fold(
                (failure) => Left(ServerFailure()),
                (mapDrivers) => mapItems = {
                      'bins': remoteMapBins,
                      'drivers': remoteMapDrivers
                    }));

        localDataSource.cacheMapItems(mapItems);
        return Right(mapItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMapItems = await localDataSource.getChachedMapItems();
        return Right(localMapItems);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
