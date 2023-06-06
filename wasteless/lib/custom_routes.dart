import 'package:flutter/material.dart';
import 'features/admin features/admin_bottom_navigation_bar.dart';
import 'features/admin features/driver/presentation/screens/admin_driver_profile.dart';
import 'features/admin features/driver/presentation/screens/all_drivers_screen.dart';
import 'features/admin features/driver/presentation/screens/driver_history.dart';
import 'features/admin features/map/presentation/screens/admin_map_screen.dart';
import 'features/admin features/settings/presentation/screens/admin_settings_screen.dart';
import 'features/admin features/tasks/presentation/screens/add_task.dart';
import 'features/admin features/tasks/presentation/screens/admin_tasks_screen.dart';
import 'features/admin features/tasks/presentation/screens/modify_task.dart';
import 'features/driver features/driver_bottom_navigation_bar.dart';
import 'features/driver features/home/screens/driver_home_screen.dart';
import 'features/driver features/map/screens/driver_map_screen.dart';
import 'features/driver features/settings/screens/driver_settings_screen.dart';
import 'features/driver features/settings/screens/profile_screen.dart';
import 'features/driver features/tasks/presentation/screens/driver_task_screen.dart';
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
  DriverMapScreen.id: (context) => const DriverMapScreen(),
  DriverSettingsScreen.id: (context) => const DriverSettingsScreen(),
  SplashScreen.id: (context) => const SplashScreen(),
  AccountType.id: (context) => const AccountType(),
  LoginScreen.id: (context) => const LoginScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
  AdminDriverProfileScreen.id: (context) => const AdminDriverProfileScreen(),
  DriverHistoryScreen.id: (context) => const DriverHistoryScreen(),
  AddTaskScreen.id: (context) => const AddTaskScreen(),
  ModifyTaskScreen.id: (context) => const ModifyTaskScreen(),
  DriverTaskScreen.id: (context) => const DriverTaskScreen()
};
