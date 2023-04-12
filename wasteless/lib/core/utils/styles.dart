// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/responsive.dart';
import 'colors.dart';

const WEB_NAVIGATION_BAR_DECORATIONS = BoxDecoration(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(80), bottomRight: Radius.circular(80)),
    color: PRIMARY_BLUE);

BoxDecoration NAVIGATION_BAR_DECORATIONS = BoxDecoration(
  color: PRIMARY_BLUE,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 4),
        blurRadius: 4)
  ],
);
TextStyle responsiveWasteSplash(BuildContext context, Color color) {
  if (isDesktop(context)) {
    return TextStyle(color: color, fontFamily: 'norwester', fontSize: 200);
  } else {
    return TextStyle(color: color, fontFamily: 'norwester', fontSize: 70);
  }
}

TextStyle WASTE_SPLASH =
    const TextStyle(color: BLACK, fontFamily: 'norwester', fontSize: 70);
TextStyle WASTE_SPLASH_GREEN = const TextStyle(
    color: PRIMARY_GREEN, fontFamily: 'norwester', fontSize: 70);

TextStyle BIN_STATUS = const TextStyle(
    fontFamily: 'Nunito',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: FONT_GRAY);

TextStyle DETAILS_BLUE = const TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: PRIMARY_BLUE);

TextStyle DETAILS_GRAY = const TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: FONT_GRAY);

TextStyle RESET_BLACK = const TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: BLACK);

TextStyle BOLD_24 = const TextStyle(
    fontSize: 24, fontFamily: 'Nunito', fontWeight: FontWeight.w700);
TextStyle NORMAL_20 = const TextStyle(fontSize: 20, fontFamily: 'Nunito');
