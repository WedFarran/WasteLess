import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../utils/colors.dart';
import '../utils/responsive.dart';
import '../utils/styles.dart';

class WasteLessBottomNavigationBar extends StatefulWidget {
  final Widget widget;
  const WasteLessBottomNavigationBar({super.key, required this.widget});

  @override
  State<WasteLessBottomNavigationBar> createState() =>
      _WasteLessBottomNavigationBarState();
}

class _WasteLessBottomNavigationBarState
    extends State<WasteLessBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.15,
        child: Stack(
          // i used a stack cause i wanted the avatar circle top raduis to apear out side the navigation rectangle
          children: [
            Center(
              child: Container(
                  height: isTablet(context) == true
                      ? context.height * 0.09
                      : context.height * 0.08,
                  margin: const EdgeInsets.only(
                      top: 40, right: 20, left: 20, bottom: 20),
                  decoration: NAVIGATION_BAR_DECORATIONS),
            ),
            Center(child: widget.widget),
          ],
        ));
  }
}
