import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors.dart';

class WasteLessTextField extends StatelessWidget {
  final TextEditingController textController;
  final Color color;
  final String title;
  final bool obscureText;
  final Color hintColor;
  final Widget? widget;
  final Key? formKey;
  final String? Function(String?)? validator;
  const WasteLessTextField(
      {super.key,
      required this.textController,
      required this.color,
      required this.title,
      required this.obscureText,
      required this.hintColor,
      this.widget,
      required this.formKey,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color: BLACK.withOpacity(0.25))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: textController,
              obscureText: obscureText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              decoration: InputDecoration(
                suffixIcon: widget,
                border: InputBorder.none,
                hintText: title,
                hintStyle: TextStyle(
                    fontFamily: 'Nunito',
                    color: hintColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
