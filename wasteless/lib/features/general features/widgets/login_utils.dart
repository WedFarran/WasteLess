import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';

class LoginUtils {
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
