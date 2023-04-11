import 'package:flutter/material.dart';
import 'package:wasteless/core/strings/localization.dart';
import 'package:wasteless/core/utils/language.dart';
import '../../../../../core/widgets/settings_widgets/settings_button.dart';
import '../../../../../main.dart';

class DriverSettingsScreen extends StatelessWidget {
  static const String id = 'driver_settings_screen';
  const DriverSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SettingsButton(
                  onTap: () async {
                    String langCode = await getLocaleString();
                    if (langCode == ARABIC_CODE) {
                      Locale locale = await setLocale(ENGLISH_CODE);
                      if (context.mounted) WasteLess.setLocale(context, locale);
                    } else if (langCode == ENGLISH_CODE) {
                      Locale locale = await setLocale(ARABIC_CODE);
                      if (context.mounted) WasteLess.setLocale(context, locale);
                    }
                  },
                  icon: Icons.language,
                  text: translations(context).change_language),
            ),
          ],
        ),
      ),
    );
  }
}
