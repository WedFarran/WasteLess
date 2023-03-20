import 'package:flutter/material.dart';
import 'package:wasteless/main.dart';
import '../../core/utils/assets_path.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../core/widgets/bottom_navigation_icon.dart';
import '../../features/admin features/driver/presentation/screens/all_drivers_screen.dart';
import '../../features/admin features/map/presentation/screens/admin_map_screen.dart';
import '../../features/admin features/settings/presentation/screens/admin_tasks_screen.dart';
import '../../features/admin features/tasks/presentation/screens/admin_tasks_screen.dart';

class AdminWasteNavigationBar extends StatefulWidget {
  static const String id = 'nabigation_bar_screen';

  const AdminWasteNavigationBar({super.key});

  @override
  State<AdminWasteNavigationBar> createState() =>
      _AdminWasteNavigationBarState();
}

class _AdminWasteNavigationBarState extends State<AdminWasteNavigationBar> {
  List<Widget> screens = const [
    DriversScreen(),
    AdminMapScreen(),
    AdminTasksScreen(),
    AdminSettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    List iconsName = [WEB_DRIVER_ICON, MAP_ICON, TASKS_ICON, SETTINGS_ICON];
    Size size = MediaQuery.of(context).size;
    int selectedIndex = 0;
    List iconsSize = [0.08, 0.09, 0.07, 0.07];
    List tabletIconSize = [0.06, 0.05, 0.07, 0.05];
    return Scaffold(
      bottomNavigationBar: WasteLessBottomNavigationBar(
        widget: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 35.0),
          itemCount: iconsName.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: size.width * 0.04,
          ),
          itemBuilder: (context, i) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = i;
              });
            },
            child: NavigationBarIconsWidget(
                selected: selectedIndex == i ? true : false,
                iconsName: iconsName[i],
                size: size,
                iconsSize: isTablet(context) == true
                    ? tabletIconSize[i]
                    : isDesktop(context) == true
                        ? 0.009
                        : iconsSize[i]),
          ),
        ),
      ),
      body: Center(
        child: screens.elementAt(selectedIndex),
      ),
    );
  }
}
