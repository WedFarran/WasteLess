import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../utils/colors.dart';

class NameAndImageWidget extends StatelessWidget {
  final String title;
  final String image;
  const NameAndImageWidget({
    required this.title,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: context.height * 0.3,
          width: context.width,
          decoration: const BoxDecoration(
            color: PRIMARY_BLUE,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: context.height * 0.15,
            width: context.width,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: LIGHT_BLUE,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      color: BLACK.withOpacity(0.25),
                      blurRadius: 4)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 65,
          ),
        )
      ],
    );
  }
}
