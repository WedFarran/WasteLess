import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../utils/colors.dart';

class WebNavigationBarIcons extends StatelessWidget {
  const WebNavigationBarIcons({
    super.key,
    required this.selectedIndex,
    required this.webIcons,
    required this.webIconSize,
  });

  final bool selectedIndex;
  final String webIcons;
  final double webIconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          width: 15,
          height: context.height * 0.07,
          duration: const Duration(
            milliseconds: 250,
          ),
          decoration: BoxDecoration(
            color: selectedIndex == true ? PRIMARY_GREEN : Colors.transparent,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
        ),
        SizedBox(
          width: selectedIndex == true
              ? context.width * 0.011
              : context.width * 0.007,
        ),
        Image.asset(
          webIcons,
          color: selectedIndex == true ? PRIMARY_GREEN : null,
          width: context.width * webIconSize,
        ),
      ],
    );
  }
}
