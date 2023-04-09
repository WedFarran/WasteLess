// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../core/utils/colors.dart';

class ChooseAccountButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color color;
  const ChooseAccountButtonWidget({
    required this.onTap,
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height * 0.15,
        width: context.width * 0.6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  color: BLACK.withOpacity(0.25))
            ]),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              color: color,
              shadows: [
                Shadow(
                    color: BLACK.withOpacity(0.25),
                    blurRadius: 4.0,
                    offset: const Offset(0, 4))
              ]),
        ),
      ),
    );
  }
}
