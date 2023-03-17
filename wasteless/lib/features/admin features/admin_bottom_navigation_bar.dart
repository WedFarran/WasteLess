import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import '../../core/utils/assets_path.dart';
import '../../core/widgets/bottom_navigation_bar.dart';
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
  int selectedIndex = 0;
  List<Widget> screens = const [
    DriversScreen(),
    AdminMapScreen(),
    AdminTasksScreen(),
    AdminSettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List iconsName = [WEB_DRIVER_ICON, MAP_ICON, TASKS_ICON, SETTINGS_ICON];
    List iconsSize = [0.08, 0.09, 0.07, 0.07];

    Widget changeScreen(int selectedIndex) {
      Widget currentScreen = screens[0];
      setState(() {
        currentScreen = screens[selectedIndex];
      });
      return currentScreen;
    }

    return Scaffold(
      bottomNavigationBar: SizedBox(
          height: size.height * 0.15,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.08,
                margin: const EdgeInsets.only(
                    top: 40, right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: PRIMARY_BLUE,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: SHADOW, offset: Offset(0, 4), blurRadius: 4)
                  ],
                ),
              ),
              ListView.separated(
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
                    print(selectedIndex);
                  },
                  child: BottomNavigationBarWidget(
                      selected: selectedIndex == i ? true : false,
                      iconsName: iconsName[i],
                      size: size,
                      iconsSize: iconsSize[i]),
                ),
              ),
            ],
          )),
      body: Center(
        child: changeScreen(selectedIndex),
      ),
    );
  }
}
