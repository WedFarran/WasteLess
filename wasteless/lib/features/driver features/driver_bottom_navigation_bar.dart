import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/features/driver%20features/settings/presentation/screens/driver_settings_screen.dart';
import 'package:wasteless/features/driver%20features/tasks/presentation/screens/driver_tasks_screen.dart';
import '../../core/utils/assets_path.dart';
import '../../core/widgets/bottom_navigation_bar.dart';
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
  int selectedIndex = 0;
  List<Widget> screens = const [
    DriverHomeScreen(),
    DriverTasksScreen(),
    DriverDriverScreen(),
    DriverSettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List iconsName = [HOME_ICON, TASKS_ICON, MAP_ICON, SETTINGS_ICON];
    List iconsSize = [0.08, 0.07, 0.09, 0.07];

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
