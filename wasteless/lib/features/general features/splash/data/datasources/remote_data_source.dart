import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashRemoteDataSource {
  Future<bool> isSignIn();
  Future<String> getCurrentUId();
}

class FirebaseAuthRemoteDataSourceImpl implements SplashRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<String> getCurrentUId() async =>
      firebaseAuth.currentUser!.email.toString();
}
