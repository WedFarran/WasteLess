import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:wasteless/core/network/network_info.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/bin_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/driver_entity.dart';
import '../../domain/repos/map_repo.dart';
import '../datasources/map_local_data_source.dart';
import '../datasources/map_remote_data_source.dart';

class AdminMapRepoImpl implements MapRepo {
  final MapRemoteDataSource remoteDataSource;
  final MapLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  AdminMapRepoImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<
          Either<Failure,
              Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>>
      getAllMapItems() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAdminMapItems =
            await remoteDataSource.getAllAdminMapItems();
        localDataSource.cacheAdminMapItems(remoteAdminMapItems);
        return Right(remoteAdminMapItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMapBins = await localDataSource.getCachedAdminMapItems();
        return Right(localMapBins);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
