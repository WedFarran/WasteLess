import '../repositories/splash_repo.dart';

class IsSignInUseCase {
  final SplashRepo repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
