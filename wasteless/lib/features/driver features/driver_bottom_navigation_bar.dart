import 'package:flutter/material.dart';
import 'package:wasteless/features/driver%20features/settings/presentation/screens/driver_settings_screen.dart';
import 'package:wasteless/features/driver%20features/tasks/presentation/screens/driver_tasks_screen.dart';
import 'package:wasteless/main.dart';
import '../../core/utils/assets_path.dart';
import '../../core/widgets/bottom_navigation_bar_widget.dart';
import 'home/presentation/screens/driver_home_screen.dart';
import 'map/presentation/screens/driver_map_screen.dart';

class DriverWasteNavigationBar extends StatefulWidget {
  static const String id = 'driver_nabigation_bar_screen';
  const DriverWasteNavigationBar({super.key});

  @override
  State<DriverWasteNavigationBar> createState() =>
      _AdminWasteNavigationBarState();
}

class _AdminWasteNavigationBarState extends State<DriverWasteNavigationBar> {
  List<Widget> screens = const [
    DriverHomeScreen(),
    DriverTasksScreen(),
    DriverDriverScreen(),
    DriverSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    List iconsName = [HOME_ICON, TASKS_ICON, MAP_ICON, SETTINGS_ICON];

    return Scaffold(
      bottomNavigationBar: WasteLessBottomNavigationBar(
        iconsName: iconsName,
      ),
      body: Center(
        child: screens.elementAt(WasteLess.screenSelectedIndex),
      ),
    );
  }
}
