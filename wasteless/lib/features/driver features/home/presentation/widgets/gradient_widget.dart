import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.19,
          width: context.width * 0.78,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: PRIMARY_GREEN),
        ),
        Container(
          height: context.height * 0.19,
          width: context.width * 0.22,
          decoration: gradient(GRADIENT1),
        ),
        Positioned(
            left: 70,
            child: Container(
              height: context.height * 0.19,
              width: context.width * 0.22,
              decoration: gradient(GRADIENT2),
            )),
        Positioned(
            right: 80,
            child: Container(
              height: context.height * 0.19,
              width: context.width * 0.22,
              decoration: gradient(GRADIENT3),
            )),
        Positioned(
          right: 0,
          child: Container(
              height: context.height * 0.19,
              width: context.width * 0.23,
              decoration: BoxDecoration(
                  color: GRADIENT4, borderRadius: BorderRadius.circular(20))),
        ),
      ],
    );
  }
}