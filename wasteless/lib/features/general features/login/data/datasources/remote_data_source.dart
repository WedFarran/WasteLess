import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRemoteDataSource {
  Future<void> signIn(String email, String password);
}

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthRemoteDataSourceImpl({required this.firebaseAuth});
  @override
  Future<void> signIn(String email, String password) async {
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}
