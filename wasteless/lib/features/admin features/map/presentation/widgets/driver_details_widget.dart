import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class DriverDetailsWidget extends StatelessWidget {
  final String name;
  final String location;
  const DriverDetailsWidget(
      {super.key, required this.name, required this.location});

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
              const CircleAvatar(
                backgroundImage: AssetImage(ANWAR_IMAGE),
                radius: 50,
              ),
              Text(name, style: BIN_STATUS),
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
        ],
      ),
    );
  }
}
