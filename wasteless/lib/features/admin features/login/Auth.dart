import 'package:flutter/material.dart';
import 'package:wasteless/features/admin%20features/login/admin_login.dart';
import 'package:wasteless/features/general%20features/splash_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});
  static const String id = 'Auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirbaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const SplashScreen();
          } else {
            return const AdminLogin();
          }
        },
      ),
    );
  }
}

class User {}
