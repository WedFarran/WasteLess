import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';

class NavigationBarIconsWidget extends StatelessWidget {
  const NavigationBarIconsWidget({
    super.key,
    required this.selected,
    required this.iconsName,
    required this.size,
    required this.iconsSize,
  });

  final bool selected;
  final String iconsName;
  final Size size;
  final double iconsSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInQuad,
      child: CircleAvatar(
        radius: isTablet(context) == true ? 35 : 30,
        backgroundColor: selected == true ? PRIMARY_GREEN : Colors.transparent,
        child: Padding(
          padding: selected == true
              ? const EdgeInsets.only(top: 0.0)
              : const EdgeInsets.only(top: 20),
          child: Image.asset(
            iconsName,
            width: size.width * iconsSize,
          ),
        ),
      ),
    );
  }
}
