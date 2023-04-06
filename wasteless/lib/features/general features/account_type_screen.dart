import 'package:flutter/material.dart';

import '../../core/utils/assets_path.dart';
import '../admin features/login/presentation/screens/admin_login.dart';
import '../driver features/login/presentation/screens/driver_login.dart';

class AccountType extends StatelessWidget {
  static const String id = 'AccountType';
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Image.asset(WASTELESS_LOGO),
            InkWell(
              child: Text('Aaministrator'),
              onTap: () {
                Navigator.pushNamed(context, AdminLogIn.id);
              },
            ),
            InkWell(
              child: Text('Driver'),
              onTap: () {
                Navigator.pushNamed(context, DriverLogIn.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
