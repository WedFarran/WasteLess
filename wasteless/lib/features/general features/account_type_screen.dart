import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/general%20features/widgets/choose_account_button_widget.dart';
import 'package:wasteless/features/general%20features/widgets/choose_account_decoration_widget.dart';
import '../../core/utils/assets_path.dart';
import '../admin features/login/admin_login.dart';
import '../driver features/login/presentation/screens/driver_login.dart';

class AccountType extends StatelessWidget {
  static const String id = 'AccountType';
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    String accountType = "";
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChooseAccountDecorationWidget(
              primaryColor: PRIMARY_BLUE,
              right: -30,
              primaryHeight: context.height * 0.12,
              bottom: 25,
              rotation: 40,
              borderRadius: 50,
              height: 0.15,
              width: 0.50,
            ),
            Image.asset(
              WASTELESS_LOGO,
              height: context.height * 0.25,
            ),
            ChooseAccountButtonWidget(
              onTap: () async {
                accountType = "Admin";
                Navigator.pushNamed(context, AdminLogin.id,
                    arguments: {"accountType": accountType});
              },
              title: 'Aaministrator',
              color: PRIMARY_BLUE,
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            ChooseAccountButtonWidget(
              onTap: () async {
                accountType = "Driver";
                Navigator.pushNamed(context, AdminLogin.id,
                    arguments: {"accountType": accountType});
              },
              title: 'Driver',
              color: PRIMARY_GREEN,
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            ChooseAccountDecorationWidget(
              primaryColor: PRIMARY_GREEN,
              primaryHeight: context.height * 0.12,
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
