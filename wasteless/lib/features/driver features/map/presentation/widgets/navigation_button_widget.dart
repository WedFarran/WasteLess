// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/utils/styles.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';

class NavigationButtonWidget extends StatelessWidget {
  final bool selected;
  final void Function()? ontap;

  const NavigationButtonWidget(
      {super.key, required this.selected, required this.ontap});

  @override
  Widget build(BuildContext context) {
    double kiloM = 50;
    String time = '15';
    String duration = int.parse(time) < 60 ? 'min' : 'hour';

    return FloatingActionButton(
        backgroundColor: WHITE,
        onPressed: () => showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            builder: (context) => Container(
                  height: context.height * 0.16,
                  width: context.width,
                  margin: const EdgeInsets.only(left: 20),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('$time $duration',
                            style: anyColorSize32(PRIMARY_GREEN)),
                        SizedBox(width: context.width * 0.01),
                        Text('($kiloM km)',
                            style: anyColorSize16(PRIMARY_BLUE)),
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
                                onPressed:ontap,

                                icon: Image.asset(NAVIGATION_ICON,
                                    height: context.height * 0.4)))),
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon:
                                const Icon(Icons.close, color: RED, size: 35))),
                  ]),
                )),
        child: Image.asset(NAVIGATION_ICON, height: context.height * 0.07));
  }
}
