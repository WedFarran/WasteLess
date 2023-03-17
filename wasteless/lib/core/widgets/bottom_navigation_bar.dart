import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AdminBottomNavigationBar extends StatelessWidget {
  const AdminBottomNavigationBar({
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
      child: CircleAvatar(
        radius: 30,
        backgroundColor: selected == true ? PRIMARY_GREEN : Colors.transparent,
        child: Padding(
          padding: selected == true
              ? const EdgeInsets.only(left: 0.0, right: 0)
              : const EdgeInsets.only(top: 20, left: 18.0, right: 0),
          child: Image.asset(
            iconsName,
            width: size.width * iconsSize,
            height: size.height * 0.1,
          ),
        ),
      ),
    );
  }
}
