import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
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
            Image.asset(
              WASTELESS_LOGO,
              height: context.height * 0.25,
            ),
            InkWell(
              child: Container(
                child: Text(
                  'Aaministrator',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      color: PRIMARY_BLUE,
                      shadows: [
                        Shadow(
                            color: BLACK.withOpacity(0.25),
                            blurRadius: 4.0,
                            offset: Offset(0, 4))
                      ]),
                ),
                height: context.height * 0.15,
                width: context.width * 0.6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: WHITE,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          color: BLACK.withOpacity(0.25))
                    ]),
              ),
              onTap: () {
                Navigator.pushNamed(context, AdminLogIn.id);
              },
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            InkWell(
              child: Container(
                child: Text(
                  'Driver',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      color: PRIMARY_GREEN,
                      shadows: [
                        Shadow(
                            color: BLACK.withOpacity(0.25),
                            blurRadius: 4.0,
                            offset: Offset(0, 4))
                      ]),
                ),
                height: context.height * 0.15,
                width: context.width * 0.6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: WHITE,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          color: BLACK.withOpacity(0.25))
                    ]),
              ),
              onTap: () {
                Navigator.pushNamed(context, DriverLogIn.id);
              },
            ),
            SizedBox(
              height: context.height * 0.05,
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
