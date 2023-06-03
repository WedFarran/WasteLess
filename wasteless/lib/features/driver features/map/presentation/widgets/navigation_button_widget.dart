// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/utils/styles.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';

class NavigationButtonWidget extends StatelessWidget {
  final bool selected;
  final double km;
  final String time;
  final void Function()? ontap;
  final void Function()? close;

  const NavigationButtonWidget(
      {super.key,
      required this.selected,
      required this.ontap,
      required this.km,
      required this.time,
      required this.close});

  @override
  Widget build(BuildContext context) {
    String duration = int.parse(time) < 60 ? 'min' : 'hour';

    return Container(
      height: context.height * 0.16,
      width: context.width,
      // margin: const EdgeInsets.only(left: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$time $duration', style: anyColorSize32(PRIMARY_GREEN)),
            SizedBox(width: context.width * 0.01),
            Text('($km km)', style: anyColorSize16(PRIMARY_BLUE)),
          ],
        ),
        SizedBox(width: context.width * 0.15),
        SizedBox(
            height: context.height * 0.1,
            width: context.width * 0.2,
            child: Material(
                elevation: 4.0,
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: IconButton(
                    onPressed: ontap,
                    icon: Image.asset(NAVIGATION_ICON,
                        height: context.height * 0.4)))),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: close,
                icon: const Icon(Icons.close, color: RED, size: 35))),
      ]),
    );
  }
}
