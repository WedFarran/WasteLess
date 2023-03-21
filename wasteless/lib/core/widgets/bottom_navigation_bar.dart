import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/responsive.dart';

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
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.15,
        child: Stack(
          // i used a stack cause i wanted the avatar circle top raduis to apear out side the navigation rectangle
          children: [
            Center(
              child: Container(
                height: isTablet(context) == true
                    ? size.height * 0.09
                    : size.height * 0.08,
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
            Center(child: widget.widget),
          ],
        ));
  }
}
