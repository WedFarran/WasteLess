import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import '../utils/colors.dart';
import '../utils/language.dart';
import '../utils/styles.dart';
import 'dialog_button.dart';

class WarningDialog extends StatelessWidget {
  final String title;
  final Function()? yesOnTap;
  final Function()? cancleOnTap;
  const WarningDialog({
    required this.cancleOnTap,
    required this.title,
    required this.yesOnTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Text(
        title,
        style: BOLD_24,
        textAlign: TextAlign.center,
      ),
      backgroundColor: LIGHT_BLUE,
      actions: [
        DialogButton(
          color: GREEN,
          title: translations(context).cancle,
          onTap: cancleOnTap,
        ),
        DialogButton(
          color: LIGHT_RED,
          title: translations(context).yes,
          onTap: yesOnTap,
        ),
      ],
    );
  }
}
