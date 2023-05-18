import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  AuthCubit({required this.signInUseCase}) : super(AuthInitial());
  Future<void> submitSignIn(String email, String password) async {
    try {
      await signInUseCase.call(email, password);
      //  emit(UserSuccess());
    } on FirebaseAuthException catch (e) {
      //emit(UserFailure());
    } catch (e) {}
  }
}
