import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../utils/styles.dart';
import 'circle_indicator.dart';

class BinDetailsWidget extends StatelessWidget {
  final double percent;
  const BinDetailsWidget({required this.percent, super.key});

  @override
  Widget build(BuildContext context) {
    double percent = 1;
    return Container(
      height: context.height * 0.30,
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleIndicator(
                percent: percent,
              ),
              Text(
                  percent < 0.4
                      ? 'Empty'
                      : percent >= 0.8
                          ? 'Full'
                          : 'Half',
                  style: BIN_STATUS),
              SizedBox(
                width: context.width * 0.01,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('location:', style: DETAILS_GRAY),
              Text('Abdullah Arif st', style: DETAILS_BLUE),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('full expected time:', style: DETAILS_GRAY),
              Text('100% in 1 Hour', style: DETAILS_BLUE)
            ],
          ),
        ],
      ),
    );
  }
}
