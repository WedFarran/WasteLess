import 'package:flutter/material.dart';

import 'colors.dart';

final appTheme = ThemeData(
    scaffoldBackgroundColor: WHITE,
    primaryColor: PRIMARY_BLUE,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: WHITE),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(PRIMARY_BLUE),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 60, vertical: 25)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    ))
    //textTheme: TextTheme()

    );
