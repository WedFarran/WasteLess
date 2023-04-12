import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/general%20features/account_type_screen.dart';
import '../../../../../core/strings/localization.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/widgets/named_and_image_widget.dart';
import '../../../../../core/widgets/settings_widgets/settings_button.dart';
import '../../../../../core/widgets/warning_dialog.dart';
import '../../../../../main.dart';

class AdminSettingsScreen extends StatelessWidget {
  static const String id = 'admin_settings_screen';
  const AdminSettingsScreen({super.key});

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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => WarningDialog(
                        title:
                            translations(context).logout_confirmation_message,
                        yesOnTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AccountType.id, (Route<dynamic> route) => false);
                        },
                        cancleOnTap: () {}),
                  );
                },
                icon: Icons.logout_outlined,
                text: translations(context).logout),
          ],
        ),
      ),
    );
  }
}
