import 'dart:async';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/assets_path.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/utils/responsive.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/splash_text_animation.dart';
import 'account_type_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'Splash_Screen';
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
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const AccountType()));
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
                  padding: EdgeInsets.only(left: isDesktop(context) ? 170 : 80),
                  child: SplashTextAnimation(
                    textStyle: responsiveWasteSplash(context, PRIMARY_GREEN),
                    title: 'LESS',
                    widget:
                        Image.asset(MOVING_PIN, height: context.height * 0.15),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
