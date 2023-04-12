import 'package:flutter/material.dart';
import 'features/admin features/admin_bottom_navigation_bar.dart';
import 'features/admin features/driver/presentation/screens/all_drivers_screen.dart';
import 'features/admin features/map/presentation/screens/admin_map_screen.dart';
import 'features/admin features/settings/presentation/screens/admin_tasks_screen.dart';
import 'features/admin features/tasks/presentation/screens/admin_tasks_screen.dart';
import 'features/driver features/driver_bottom_navigation_bar.dart';
import 'features/driver features/home/presentation/screens/driver_home_screen.dart';
import 'features/driver features/map/presentation/screens/driver_map_screen.dart';
import 'features/driver features/settings/presentation/screens/driver_settings_screen.dart';
import 'features/driver features/settings/presentation/screens/profile_screen.dart';
import 'features/driver features/tasks/presentation/screens/driver_tasks_screen.dart';
import 'features/general features/account_type_screen.dart';
import 'features/general features/splash_screen.dart';
import 'features/general features/wasteless_login_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  AdminWasteNavigationBar.id: (context) => const AdminWasteNavigationBar(),
  DriversScreen.id: (context) => const DriversScreen(),
  AdminMapScreen.id: (context) => const AdminMapScreen(),
  AdminSettingsScreen.id: (context) => const AdminSettingsScreen(),
  AdminTasksScreen.id: (context) => const AdminTasksScreen(),
  DriverWasteNavigationBar.id: (context) => const DriverWasteNavigationBar(),
  DriverHomeScreen.id: (context) => const DriverHomeScreen(),
  DriverDriverScreen.id: (context) => const DriverDriverScreen(),
  DriverSettingsScreen.id: (context) => const DriverSettingsScreen(),
  DriverTasksScreen.id: (context) => const DriverTasksScreen(),
  SplashScreen.id: (context) => const SplashScreen(),
  AccountType.id: (context) => const AccountType(),
  LoginScreen.id: (context) => const LoginScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
};
