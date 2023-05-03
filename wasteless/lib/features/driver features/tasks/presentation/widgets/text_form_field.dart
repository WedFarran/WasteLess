import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines});
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: BLACK),
        maxLines: maxLines,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            hintText: hintText,
            hintStyle: const TextStyle(color: GREY),
            filled: true,
            fillColor: EXTRA_LIGHT_BLUE,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
