import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';

class NavigationButtonWidget extends StatelessWidget {
  final bool selected;
  final void Function()? ontap;

  const NavigationButtonWidget(
      {super.key, required this.selected, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '15 min',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              color: PRIMARY_GREEN,

            ),
          ),
          Text(
            '(50 km)',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              color: PRIMARY_BLUE,
            ),
          ),

          Material(
            elevation: 4.0,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            child: IconButton(
              onPressed: () {
                // Do something when the new button is pressed
              },
              icon: Image.asset(
                NAVIGATION_BUTTON,
                height: context.height * 0.10,
              ),
            ),
          ),

          // Column(
          // mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.center,
          //children: [
          SizedBox(height: 110.0),
          Positioned(
            top: 30.0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                CLOSE_BUTTON,
                height: context.height * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
