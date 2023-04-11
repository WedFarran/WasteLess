import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/colors.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final String title;
  const Button(
      {super.key,
      required this.color,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    color: BLACK.withOpacity(0.25))
              ]),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'Nunito',
                color: WHITE,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          )),
        ),
      ),
    );
  }
}
