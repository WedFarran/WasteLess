// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const TABLET = 'tablet';
const DESKTOP = 'desktop';

bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 660;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 940;
