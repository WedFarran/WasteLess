import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../utils/styles.dart';
import 'circle_indicator.dart';

class BinDetailsWidget extends StatelessWidget {
  final double percent;
  final String location;
  final String fullnesTime;
  const BinDetailsWidget(
      {required this.percent,
      super.key,
      required this.fullnesTime,
      required this.location});

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
              Text('location:', style: anyColorSize16(FONT_GRAY)),
              Text(location, style: anyColorSize16(PRIMARY_BLUE)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('full expected time:', style: anyColorSize16(FONT_GRAY)),
              Text(fullnesTime, style: anyColorSize16(PRIMARY_BLUE))
            ],
          ),
        ],
      ),
    );
  }
}
