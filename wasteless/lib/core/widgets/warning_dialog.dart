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
  final bool? displayCancleButton;
  final bool? displayYesButton;
  const WarningDialog({
    this.cancleOnTap,
    required this.title,
    this.yesOnTap,
    this.displayCancleButton,
    this.displayYesButton,
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
        Visibility(
          visible: displayCancleButton!,
          child: DialogButton(
            color: GREEN,
            title: translations(context).cancle,
            onTap: cancleOnTap,
          ),
        ),
        Visibility(
          visible: displayYesButton!,
          child: DialogButton(
            color: LIGHT_RED,
            title: translations(context).yes,
            onTap: yesOnTap,
          ),
        ),
      ],
    );
  }
}
