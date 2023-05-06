import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:wasteless/features/driver%20features/map/data/datasources/bins_local_data_source.dart';
import 'package:wasteless/features/driver%20features/map/data/datasources/bins_remote_data_source.dart';
import 'package:wasteless/features/driver%20features/map/domain/repos/driver_map_repos.dart';

import '../../../../../core/common/domain/entity/driver_entity.dart';
import '../../../../../core/network/network_info.dart';

class DriverMapReposImpl implements DriverMapRepos {
  final BinsRemoteDataSource remoteDataSource;
  final BinsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DriverMapReposImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<DriverEntity>>> getAllBins() async {
    //if it return a failure
    if (await networkInfo.isConnected) {
      try {
        final remoteBins = await remoteDataSource.getAllBins();
        localDataSource.cachedBins(remoteBins);
        return Right(remoteBins.cast<DriverEntity>());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        //if there is no connection it will bring the data form the localDataSource
        final localBins = await localDataSource.getCachedBins();
        return Right(localBins.cast<DriverEntity>());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
