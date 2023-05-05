import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class TaskUtils {
  static GlobalKey<ScaffoldMessengerState> massengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? message) {
    if (message == null) return;
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: RED,
    );
    massengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
