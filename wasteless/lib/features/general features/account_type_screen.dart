import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/features/general%20features/widgets/choose_account_decoration_widget.dart';
import '../../core/utils/assets_path.dart';
import '../admin features/login/presentation/screens/admin_login.dart';
import '../driver features/login/presentation/screens/driver_login.dart';

class AccountType extends StatelessWidget {
  static const String id = 'AccountType';
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ChooseAccountDecorationWidget(
              primaryColor: PRIMARY_BLUE,
              right: -30,
              bottom: 25,
              rotation: 40,
              borderRadius: 50,
              height: 0.15,
              width: 0.50,
            ),
            Image.asset(WASTELESS_LOGO),
            InkWell(
              child: const Text('Aaministrator'),
              onTap: () {
                Navigator.pushNamed(context, AdminLogIn.id);
              },
            ),
            InkWell(
              child: const Text('Driver'),
              onTap: () {
                Navigator.pushNamed(context, DriverLogIn.id);
              },
            ),
            const ChooseAccountDecorationWidget(
              primaryColor: PRIMARY_GREEN,
              left: -90,
              bottom: -20,
              rotation: -50,
              borderRadius: 95,
              height: 0.35,
              width: 0.60,
            ),
          ],
        ),
      ),
    );
  }
}
