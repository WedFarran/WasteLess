import 'package:flutter/material.dart';

bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 660;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 940;
