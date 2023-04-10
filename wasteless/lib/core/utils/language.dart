import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../strings/localization.dart';

Future<Locale> setLocale(String langCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LAGUAGE_CODE, langCode);
  return _locale(langCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String langCode = prefs.getString(LAGUAGE_CODE) ?? ENGLISH_CODE;
  return _locale(langCode);
}

Future<String> getLocaleString() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String langCode = prefs.getString(LAGUAGE_CODE) ?? ENGLISH_CODE;
  return langCode;
}

Locale _locale(String langCode) {
  switch (langCode) {
    case ENGLISH_CODE:
      return const Locale(ENGLISH_CODE, 'US');

    case ARABIC_CODE:
      return const Locale(ARABIC_CODE, "SA");
    default:
      return const Locale(ENGLISH_CODE, 'US');
  }
}

AppLocalizations translations(BuildContext context) {
  return AppLocalizations.of(context)!;
}
