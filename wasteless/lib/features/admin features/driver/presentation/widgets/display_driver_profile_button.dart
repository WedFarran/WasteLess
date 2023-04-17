import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class DisplayDriverProfileWidget extends StatelessWidget {
  final String image;
  final String name;
  final Function()? onTap;
  const DisplayDriverProfileWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height * 0.12,
        width: context.width * 0.2,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: LIGHT_BLUE,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: BLACK.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ]),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              backgroundColor: WHITE,
              radius: 35,
            ),
            SizedBox(
              width: context.width * 0.06,
            ),
            Text(
              name,
              style: anyColorSize16(PRIMARY_BLUE),
            )
          ],
        ),
      ),
    );
  }
}
