import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

// ignore: must_be_immutable
class SettingsButton extends StatelessWidget {
  VoidCallback onTap;
  IconData icon;
  String text;
  SettingsButton(
      {super.key, required this.icon, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: PRIMARY_GREEN,
              size: 30,
            ),
            Text(
              text,
              style: RESET_BLACK,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: PRIMARY_GREEN,
            ),
          ],
        ),
      ),
    );
  }
}
