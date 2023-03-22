import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/network/network_info.dart';

import 'features/admin features/map/data/datasources/map_local_data_source.dart';
import 'features/admin features/map/data/datasources/map_remote_data_source.dart';
import 'features/admin features/map/data/repos/map_repo_impl.dart';
import 'features/admin features/map/domain/repos/map_repo.dart';
import 'features/admin features/map/domain/usecases/get_all_map_bins.dart';
import 'features/admin features/map/domain/usecases/get_all_map_drivers.dart';
import 'features/admin features/map/presentation/bloc/bloc/map_itemss_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // features - admin map

  // bloc
  sl.registerFactory(() =>
      MapItemssBloc(getAllMapBinsUsecase: sl(), getAllMapDriversUsecase: sl()));

  //usecases

  sl.registerLazySingleton(() => GetAllAdminMapItemsUsecase(sl()));
  sl.registerLazySingleton(() => GetAllMapDriversUsecase(sl()));

  //repos

  sl.registerLazySingleton<MapRepo>(() => AdminMapRepoImpl(
      localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));

  //datasources

  sl.registerLazySingleton<MapRemoteDataSource>(
    () => MapRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<MapLocalDataSource>(
    () => MapLocalDataSourceImpl(sharedPrefrences: sl()),
  );

  // core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
