import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  const NavigationButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '15 min',
            style: TextStyle(
              fontSize: 32.0,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              color: Color(0x539F35),
            ),
          ),
          Text(
            '(50 km)',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              color: Color(0x00668A),
            ),
          ),
        ],
      ),
    );
  }
}

