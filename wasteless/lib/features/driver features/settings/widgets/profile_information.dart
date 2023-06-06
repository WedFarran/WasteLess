import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';

class ProfileInformation extends StatelessWidget {
  final String title;
  final String information;
  const ProfileInformation({
    required this.title,
    required this.information,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 25, bottom: 15, right: 25),
        height: context.height * 0.07,
        width: context.width * 0.83,
        decoration: BoxDecoration(
            border: Border.all(color: PRIMARY_BLUE),
            borderRadius: BorderRadius.circular(6),
            color: WHITE,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: BLACK.withOpacity(0.25))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 15, color: FONT_GRAY),
              ),
              Text(
                information,
                style: const TextStyle(fontSize: 15, color: FONT_GRAY),
              )
            ],
          ),
        ),
      ),
    );
  }
}
