import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/network/network_info.dart';
import 'package:wasteless/features/admin%20features/map/domain/entity/driver_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entity/bin_entity.dart';
import 'package:wasteless/core/errors/failure.dart';
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
  List<BinEntity> getAllMapBins() {
    //if (await networkInfo.isConnected) {
    try {
      final remoteMapBins = remoteDataSource.getAllMapBins();
      return remoteMapBins;
    } on ServerException {
      throw ServerFailure();
    }
    // }
  }

  @override
  List<DriverEntity> getAllMapDrivers() {
    //   if (await networkInfo.isConnected) {
    try {
      final remoteMapDrivers = remoteDataSource.getAllMapDrivers();
      return remoteMapDrivers;
    } on ServerException {
      throw ServerFailure();
    }
  }
}
//}
