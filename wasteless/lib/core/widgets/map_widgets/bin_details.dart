import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

class BinDetailsWidget extends StatelessWidget {
  const BinDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.35,
      margin: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: const [
              Text('50'),
              Text('location'),
              Text('full expected time')
            ],
          ),
          Column(
            children: const [
              Text('half'),
              Text('Abdullah '),
              Text('100% in 1 Hour')
            ],
          )
        ],
      ),
    );
  }
}
