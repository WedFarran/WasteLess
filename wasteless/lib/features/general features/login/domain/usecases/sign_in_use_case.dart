import 'package:wasteless/features/general%20features/login/domain/repositories/firebase_auth_repo.dart';

class SignInUseCase {
  final FirebaseAuthRepo repo;
  SignInUseCase({required this.repo});
  Future<void> call(String email, String password) async {
    return repo.signIn(email, password);
  }
}
