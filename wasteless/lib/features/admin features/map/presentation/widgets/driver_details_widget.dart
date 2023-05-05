import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class DriverDetailsWidget extends StatelessWidget {
  final String name;
  final String location;
  final String image;
  const DriverDetailsWidget(
      {super.key,
      required this.name,
      required this.location,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.24,
      margin: const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                backgroundColor: WHITE,
                radius: 50,
              ),
              SizedBox(
                width: context.width * 0.06,
              ),
              Expanded(
                child: Text(
                  name,
                  style: BIN_STATUS,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${translations(context).location}:',
                style: anyColorSize16(FONT_GRAY),
              ),
              SizedBox(
                width: context.width * 0.17,
              ),
              Expanded(
                child: Text(
                  location,
                  style: anyColorSize16(PRIMARY_BLUE),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
