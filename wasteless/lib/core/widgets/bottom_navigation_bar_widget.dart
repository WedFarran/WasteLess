import 'package:flutter/material.dart';
import '../../main.dart';
import '../utils/colors.dart';
import '../utils/responsive.dart';
import 'bottom_navigation_icon.dart';

class WasteLessBottomNavigationBar extends StatefulWidget {
  final List iconsName;
  const WasteLessBottomNavigationBar({super.key, required this.iconsName});

  @override
  State<WasteLessBottomNavigationBar> createState() =>
      _WasteLessBottomNavigationBarState();
}

class _WasteLessBottomNavigationBarState
    extends State<WasteLessBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    List iconsSize = [0.08, 0.09, 0.07, 0.07];
    List tabletIconSize = [0.06, 0.05, 0.07, 0.05];
    List desktopIconSize = [0.009, 0.009, 0.009, 0.009];
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.15,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: size.height * 0.08,
                margin: const EdgeInsets.only(
                    top: 40, right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: PRIMARY_BLUE,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4)
                  ],
                ),
              ),
            ),
            Center(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 35.0),
                itemCount: widget.iconsName.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: size.width * 0.04,
                ),
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      WasteLess.screenSelectedIndex = i;
                    });
                  },
                  child: NavigationBarIconsWidget(
                      selected:
                          WasteLess.screenSelectedIndex == i ? true : false,
                      iconsName: widget.iconsName[i],
                      size: size,
                      iconsSize: isTablet(context) == true
                          ? tabletIconSize[i]
                          : isDesktop(context) == true
                              ? desktopIconSize[i]
                              : iconsSize[i]),
                ),
              ),
            ),
          ],
        ));
  }
}
