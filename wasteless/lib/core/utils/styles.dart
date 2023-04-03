// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

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
