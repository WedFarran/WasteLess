import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utils/colors.dart';

class CircleIndicator extends StatelessWidget {
  final double percent;

  const CircleIndicator({
    required this.percent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(70),
      child: CircularPercentIndicator(
        radius: 62.0,
        lineWidth: 15.0,
        backgroundColor: Colors.transparent,
        percent: percent,
        animation: true,
        fillColor: CIRCLE.withOpacity(0.33),
        center: Text(
          "${(percent * 100).toInt()}%",
          style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: FONT_GRAY),
        ),
        progressColor: percent < 0.4
            ? PRIMARY_GREEN
            : percent >= 0.8
                ? RED
                : YELLOW,
      ),
    );
  }
}
