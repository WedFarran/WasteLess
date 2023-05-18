import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_current_uid_usecase.dart';
import '../../domain/usecases/is_sign_in_usecase.dart';
import 'is_sign_in_state.dart';

class IsSignInCubit extends Cubit<IsSignInState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  IsSignInCubit(
      {required this.isSignInUseCase, required this.getCurrentUidUseCase})
      : super(IsSignInInitial());
  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();
      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(SignedIn(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } on SocketException catch (e) {
      emit(Failure(e: e));
    }
  }
}
