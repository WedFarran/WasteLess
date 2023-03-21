import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/features/admin%20features/settings/presentation/screens/admin_tasks_screen.dart';
import 'package:wasteless/features/admin%20features/tasks/presentation/screens/admin_tasks_screen.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/bottom_navigation_icon.dart';
import 'driver/presentation/screens/all_drivers_screen.dart';
import 'map/presentation/screens/admin_map_screen.dart';

class AdminWasteNavigationBar extends StatefulWidget {
  static const String id = 'navigation_bar_screen';

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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List iconsName = [WEB_DRIVER_ICON, MAP_ICON, TASKS_ICON, SETTINGS_ICON];
    List webIcons = [
      WEB_DRIVER_ICON,
      TASKS_ICON,
      WEB_MAP_ICON,
      WEB_SETTINGS_ICON
    ];
    Size size = MediaQuery.of(context).size;

    List iconsSize = [0.08, 0.09, 0.07, 0.07];
    List tabletIconSize = [0.05, 0.05, 0.04, 0.05];
    List webIconSize = [0.02, 0.05, 0.04, 0.05];
    return Scaffold(
      bottomNavigationBar: isDesktop(context)
          ? Container(
              width: size.width * 0.2,
              margin: const EdgeInsets.only(right: 3650),
              // height: size.height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      bottomRight: Radius.circular(80)),
                  color: PRIMARY_BLUE),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 300),
                child: ListView.separated(
                  // shrinkWrap: true,
                  itemCount: webIcons.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: size.height * 0.14,
                  ),
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      height: size.height * 0.06,
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      // width: 4,
                      decoration: BoxDecoration(
                          border: selectedIndex == i
                              ? const Border(
                                  left: BorderSide(
                                      width: 10, color: PRIMARY_GREEN))
                              : null),
                      child: Image.asset(
                        webIcons[i],
                        color: selectedIndex == i ? PRIMARY_GREEN : null,
                        width: size.width * webIconSize[i],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : WasteLessBottomNavigationBar(
              widget: ListView.separated(
                shrinkWrap: true,
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
