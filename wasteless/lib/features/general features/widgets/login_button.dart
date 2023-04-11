import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback signIn;
  final Color color;
  const LoginButton({super.key, required this.color, required this.signIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: signIn,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    color: BLACK.withOpacity(0.25))
              ]),
          child: const Center(
              child: Text(
            'LOGIN',
            style: TextStyle(
                fontFamily: 'Nunito',
                color: WHITE,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          )),
        ),
      ),
    );
  }
}
