import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteless/core/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wasteless/features/admin%20features/map/presentation/bloc/map_items_bloc.dart';
import 'features/admin features/admin_bottom_navigation_bar.dart';
import 'features/admin features/driver/presentation/screens/all_drivers_screen.dart';
import 'features/admin features/login/presentation/screens/admin_login.dart';
import 'features/admin features/map/presentation/screens/admin_map_screen.dart';
import 'features/admin features/settings/presentation/screens/admin_tasks_screen.dart';
import 'features/admin features/tasks/presentation/screens/admin_tasks_screen.dart';
import 'features/driver features/driver_bottom_navigation_bar.dart';
import 'features/driver features/home/presentation/screens/driver_home_screen.dart';
import 'features/driver features/login/presentation/screens/driver_login.dart';
import 'features/driver features/map/presentation/screens/driver_map_screen.dart';
import 'features/driver features/settings/presentation/screens/driver_settings_screen.dart';
import 'features/driver features/tasks/presentation/screens/driver_tasks_screen.dart';
import 'features/general features/account_type_screen.dart';
import 'features/general features/splash_screen.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const WasteLess());
}

class WasteLess extends StatelessWidget {
  const WasteLess({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<MapItemsBloc>()..add(GetAllMapItemsEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'WasteLess',
        initialRoute: DriverMapScreen.id,
        routes: {
          /*AdminWasteNavigationBar.id: (context) =>
              const AdminWasteNavigationBar(),
          DriversScreen.id: (context) => const DriversScreen(),
          AdminMapScreen.id: (context) => const AdminMapScreen(),
          AdminSettingsScreen.id: (context) => const AdminSettingsScreen(),
          AdminTasksScreen.id: (context) => const AdminTasksScreen(),
          */DriverWasteNavigationBar.id: (context) =>
              const DriverWasteNavigationBar(),
          DriverHomeScreen.id: (context) => const DriverHomeScreen(),
          DriverMapScreen.id: (context) => const DriverMapScreen(),
          DriverSettingsScreen.id: (context) => const DriverSettingsScreen(),
          DriverTasksScreen.id: (context) => const DriverTasksScreen(),
          SplashScreen.id: (context) => const SplashScreen(),
          AccountType.id: (context) => const AccountType(),
          AdminLogIn.id: (context) => const AdminLogIn(),
          DriverLogIn.id: (context) => const DriverLogIn(),
        },
      ),

    );
  }
}
