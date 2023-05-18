import '../repositories/splash_repo.dart';

class GetCurrentUidUseCase {
  final SplashRepo repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}
