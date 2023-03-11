import 'package:dartz/dartz.dart';
import 'package:wasteless/admin%20features/map/domain/repos/map_repo.dart';
import 'package:wasteless/core/errors/failure.dart';

import '../datasources/map_local_data_source.dart';
import '../datasources/map_remote_data_source.dart';

class MapRepoImpl implements MapRepo {
  final MapRemoteDataSource remoteDataSource;
  final MapLocalDataSource localDataSource;
  MapRepoImpl({required this.localDataSource, required this.remoteDataSource});
  @override
  Future<Either<Failure, List>> getAllMapItems() async {
    await remoteDataSource.getAllMapItems();
    await localDataSource.getCachedMaoItems();
    throw UnimplementedError();
  }

  @override
  displayDetails(String objectType, Object opject) {
    // TODO: implement displayDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List>> filterMapItems(List filterdItems) {
    // TODO: implement filterMapItems
    throw UnimplementedError();
  }
}
