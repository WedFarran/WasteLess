import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../utils/colors.dart';

class ScaffoldBlueBackground extends StatelessWidget {
  final Widget widget;
  const ScaffoldBlueBackground({super.key, required this.widget, required Padding child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_BLUE,
        body: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              height: context.height * 0.90,
              width: context.width,
              decoration: const BoxDecoration(
                  color: WHITE,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: widget,
            )));
  }
}
