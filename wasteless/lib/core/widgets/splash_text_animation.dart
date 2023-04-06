import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashTextAnimation extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final Widget? widget;
  const SplashTextAnimation({
    super.key,
    required this.title,
    required this.textStyle,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
            TyperAnimatedText(title,
                textStyle: textStyle, speed: const Duration(milliseconds: 350)),
          ]),
          widget!
        ]);
  }
}
