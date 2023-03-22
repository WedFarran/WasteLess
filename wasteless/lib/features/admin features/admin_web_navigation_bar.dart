import 'package:flutter/material.dart';
import '../../core/utils/assets_path.dart';
import '../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../features/admin features/driver/presentation/screens/all_drivers_screen.dart';
import '../../features/admin features/map/presentation/screens/admin_map_screen.dart';
import '../../features/admin features/settings/presentation/screens/admin_tasks_screen.dart';
import '../../features/admin features/tasks/presentation/screens/admin_tasks_screen.dart';
import '../../main.dart';

class AdminWasteNavigationBar extends StatelessWidget {
  static const String id = 'nabigation_bar_screen';

  const AdminWasteNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List iconsName = [
      WEB_DRIVER_ICON,
      WEB_DRIVER_ICON,
      TASKS_ICON,
      WEB_SETTINGS_ICON
    ];
    List<Widget> screens = const [
      DriversScreen(),
      AdminMapScreen(),
      AdminTasksScreen(),
      AdminSettingsScreen()
    ];
    return Scaffold(
      bottomNavigationBar: WasteLessBottomNavigationBar(
        widget: Center(),
      ),
      body: Center(
        child: screens.elementAt(WasteLess.screenSelectedIndex),
      ),
    );
  }
}