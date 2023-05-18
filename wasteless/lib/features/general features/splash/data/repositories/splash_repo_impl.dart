import '../../domain/repositories/splash_repo.dart';
import '../datasources/remote_data_source.dart';

class SplashRepoImpl implements SplashRepo {
  final SplashRemoteDataSource remoteDataSource;
  SplashRepoImpl({required this.remoteDataSource});

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();
  @override
  Future<String> getCurrentUId() async => remoteDataSource.getCurrentUId();
}
