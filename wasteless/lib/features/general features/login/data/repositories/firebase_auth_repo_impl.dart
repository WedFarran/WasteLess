import 'package:wasteless/features/general%20features/login/data/datasources/remote_data_source.dart';

import '../../domain/repositories/firebase_auth_repo.dart';

class FirebaseAuthRepoImpl implements FirebaseAuthRepo {
  final FirebaseAuthRemoteDataSource remoteDataSource;
  FirebaseAuthRepoImpl({required this.remoteDataSource});
  @override
  Future<void> signIn(String email, String password) async =>
      remoteDataSource.signIn(email, password);
}
