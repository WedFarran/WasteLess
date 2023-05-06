/*import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/network/network_info.dart';
import 'package:wasteless/features/admin%20features/map/data/datasources/map_items_remote_data_source.dart';
import 'package:wasteless/features/admin%20features/map/data/repos/map_items_repo_impl.dart';
import 'features/admin features/map/data/datasources/map_items_local_data_source.dart';
import 'features/admin features/map/domain/repo/map_items_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // features - admin map

  // bloc
  //usecases
  /* sl.registerLazySingleton(() => GetAllAdminMapBinsUseCase(sl()));
  sl.registerLazySingleton(() => GetAllAdminMapDriversUseCase(sl()));*/
  //repos
  sl.registerLazySingleton<MapItemsRepo>(() => MapItemsRepoImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  //datasources
  sl.registerLazySingleton<MapItemsRemoteDataSource>(
      () => MapItemsRemoteSourceImp(client: sl()));
  sl.registerLazySingleton<MapItemsLocalDataSource>(
      () => MapItemsLocalDataSourceImpl(sharedPreferences: sl()));

  // core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}*/
