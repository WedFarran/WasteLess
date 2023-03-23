import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/settings/presentation/screens/admin_tasks_screen.dart';
import 'package:wasteless/features/admin%20features/tasks/presentation/screens/admin_tasks_screen.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/bottom_navigation_icon.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../core/widgets/web_navigation_bar_icons.dart';
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
      WEB_MAP_ICON,
      TASKS_ICON,
      WEB_SETTINGS_ICON
    ];

    List iconsSize = [0.08, 0.09, 0.07, 0.07];
    List tabletIconSize = [0.05, 0.05, 0.04, 0.05];
    List webIconSize = [0.017, 0.018, 0.016, 0.017];
    return Scaffold(
      bottomNavigationBar: isDesktop(context)
          ? null
          : WasteLessBottomNavigationBar(
              widget: ListView.separated(
                shrinkWrap: true,
                itemCount: iconsName.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: context.width * 0.04,
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
                  ),
                ),
              ),
            ),
      body: isDesktop(
              context) //if the width is larger than display the web UI if not display the app UI
          ? Row(
              children: [
                Container(
                  width: context.width * 0.04,
                  alignment: Alignment.center,
                  decoration: WEB_NAVIGATION_BAR_DECORATIONS,
                  child: Padding(
                    padding: desktopHight(context) == true
                        ? const EdgeInsets.symmetric(vertical: 200)
                        : const EdgeInsets.symmetric(vertical: 300),
                    child: ListView.separated(
                      itemCount: webIcons.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: context.width * 0.07,
                      ),
                      itemBuilder: (context, i) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          child: WebNavigationBarIcons(
                              selectedIndex: selectedIndex == i ? true : false,
                              webIcons: webIcons[i],
                              webIconSize: webIconSize[i])),
                    ),
                  ),
                ),
                screens.elementAt(selectedIndex)
              ],
            )
          : Center(
              child: screens.elementAt(selectedIndex),
            ),
    );
  }
}
