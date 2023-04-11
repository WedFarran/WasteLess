import 'package:flutter/material.dart';
import 'package:wasteless/core/strings/localization.dart';
import 'package:wasteless/core/utils/assets_path.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/widgets/named_and_image_widget.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const NameAndImageWidget(
              title: 'Ahmed Kamal',
              image: WASTELESS_LOGO,
            ),
            SizedBox(height: context.height * 0.05),
            SettingsButton(
                onTap: () {},
                icon: Icons.person_3_outlined,
                text: translations(context).profile),
            SettingsButton(
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
            SettingsButton(
                onTap: () {},
                icon: Icons.logout_outlined,
                text: translations(context).logout),
          ],
        ),
      ),
    );
  }
}
