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
TextStyle WASTE_SPLASH =
    const TextStyle(color: BLACK, fontFamily: 'norwester', fontSize: 84);
TextStyle WASTE_SPLASH_GREEN = const TextStyle(
    color: PRIMARY_GREEN, fontFamily: 'norwester', fontSize: 84);
