import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../utils/colors.dart';

class DialogButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color color;
  const DialogButton({
    required this.onTap,
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: context.height * 0.07,
            width: context.width * 0.35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  color: WHITE,
                  shadows: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: BLACK.withOpacity(0.25),
                        blurRadius: 4)
                  ]),
            )),
      ),
    );
  }
}
