import 'package:flutter/material.dart';
import 'package:wasteless/features/driver%20features/settings/presentation/screens/driver_settings_screen.dart';
import 'package:wasteless/features/driver%20features/tasks/presentation/screens/driver_tasks_screen.dart';
import '../../core/utils/assets_path.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/bottom_navigation_bar.dart';
import '../../core/widgets/bottom_navigation_icon.dart';
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

    List iconsSize = [0.08, 0.09, 0.07, 0.07];
    List tabletIconSize = [0.06, 0.05, 0.07, 0.05];
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
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
