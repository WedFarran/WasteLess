import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/assets_path.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/utils/responsive.dart';
import 'package:wasteless/features/admin%20features/admin_bottom_navigation_bar.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/splash_text_animation.dart';
import '../driver features/driver_bottom_navigation_bar.dart';
import 'account_type_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'Splash_Screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2600), () {
      setState(() {
        visibility = true;
      });
    });
    Timer(const Duration(milliseconds: 6000), () {
      var user = FirebaseAuth.instance.currentUser;
      user == null
          ? Navigator.of(context).pushNamed(AccountType.id)
          : user.email!.contains('@wl.a.com')
              ? Navigator.of(context).pushNamed(AdminWasteNavigationBar.id)
              : Navigator.of(context).pushNamed(DriverWasteNavigationBar.id);
    });
  }

  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SplashTextAnimation(
              textStyle: responsiveWasteSplash(context, BLACK),
              title: 'WASTE',
              widget: const SizedBox(),
            ),
            Visibility(
                visible: visibility,
                child: Padding(
                  padding: EdgeInsets.only(left: isDesktop(context) ? 150 : 50),
                  child: SplashTextAnimation(
                    textStyle: responsiveWasteSplash(context, PRIMARY_GREEN),
                    title: 'LESS',
                    widget: Image.asset(MOVING_PIN,
                        height: isDesktop(context)
                            ? context.height * 0.22
                            : context.height * 0.12),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
