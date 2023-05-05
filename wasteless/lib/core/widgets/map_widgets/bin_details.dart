import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
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
    return Container(
      height: context.height * 0.30,
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleIndicator(percent: percent),
              Text(
                  percent < 0.4
                      ? translations(context).empty
                      : percent >= 0.8
                          ? translations(context).full
                          : translations(context).half_full,
                  style: BIN_STATUS),
              SizedBox(width: context.width * 0.01)
            ],
          ),
          Row(
            children: [
              Text('${translations(context).location}:',
                  style: anyColorSize16(FONT_GRAY)),
              SizedBox(width: context.width * 0.2),
              Expanded(
                  child: Text(location,
                      style: anyColorSize16(PRIMARY_BLUE),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
          Row(
            children: [
              Text('${translations(context).full_expected_time}:',
                  style: anyColorSize16(FONT_GRAY)),
              SizedBox(width: context.width * 0.2),
              Expanded(
                  child: Text(fullnesTime,
                      style: anyColorSize16(PRIMARY_BLUE),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis))
            ],
          ),
        ],
      ),
    );
  }
}
