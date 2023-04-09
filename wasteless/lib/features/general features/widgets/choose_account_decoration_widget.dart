import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../core/utils/colors.dart';

class ChooseAccountDecorationWidget extends StatelessWidget {
  final Color primaryColor;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final int? rotation;
  final double borderRadius;
  final double height;
  final double width;

  const ChooseAccountDecorationWidget({
    super.key,
    required this.primaryColor,
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.rotation,
    required this.borderRadius,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.12,
          width: context.width,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(color: primaryColor, boxShadow: [
            BoxShadow(
                color: BLACK.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4))
          ]),
        ),
        Positioned(
          right: right,
          bottom: bottom,
          left: left,
          top: top,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(rotation! / 360),
            child: Container(
              height: context.height * height,
              width: context.width * width,
              decoration: BoxDecoration(
                  color: WHITE.withOpacity(0.58),
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [
                    BoxShadow(
                        color: BLACK.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
