import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/features/general%20features/splash_screen.dart';
import 'core/providers/map/filtering_change_notifier.dart';
import 'custom_routes.dart';
import 'features/driver features/tasks/presentation/bloc/task_bloc.dart';
import 'features/general features/widgets/login_utils.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

final navigatorKey = GlobalKey<NavigatorState>();

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
        ChangeNotifierProvider(
          create: (context) => FilteringChangeNotifier(),
        ),
        BlocProvider(create: (_) => TaskBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(411.42857142857144, 890.2857142857143),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          scaffoldMessengerKey: LoginUtils.massengerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: WHITE),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          initialRoute: SplashScreen.id,
          routes: customRoutes,
        ),
      ),
    );
  }
}
