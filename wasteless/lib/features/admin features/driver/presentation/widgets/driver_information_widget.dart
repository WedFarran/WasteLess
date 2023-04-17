import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class DriverInformationWidget extends StatelessWidget {
  final String title;
  final String content;
  const DriverInformationWidget({
    required this.content,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: anyColorSize16(PRIMARY_BLUE),
          ),
          Container(
            height: context.height * 0.055,
            width: context.width * 0.55,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: PRIMARY_BLUE),
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              content,
              style: anyColorSize16(BLACK),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
