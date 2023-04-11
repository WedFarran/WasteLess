import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/features/admin%20features/map/presentation/bloc/map_items_bloc.dart';
import 'package:wasteless/features/general%20features/account_type_screen.dart';
import 'package:wasteless/features/general%20features/admin_login.dart';
import 'custom_routes.dart';
import 'features/driver features/settings/presentation/screens/driver_settings_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const WasteLess());
}

class WasteLess extends StatefulWidget {
  const WasteLess({super.key});
  static void setLocale(BuildContext context, Locale newLocale) {
    _WasteLessState? state = context.findAncestorStateOfType<_WasteLessState>();
    state?.setLocale(newLocale);
  }

  @override
  State<WasteLess> createState() => _WasteLessState();
}

class _WasteLessState extends State<WasteLess> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<MapItemsBloc>()..add(GetAllMapItemsEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: WHITE),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        initialRoute: AccountType.id,
        routes: customRoutes,
      ),
    );
  }
}
