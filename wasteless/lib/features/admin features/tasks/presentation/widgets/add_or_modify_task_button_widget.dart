// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class AddOrModifyTaskButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const AddOrModifyTaskButtonWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: context.height * 0.06,
            width: context.width * 0.4,
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: PRIMARY_GREEN,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 3.5),
                      blurRadius: 4,
                      color: BLACK.withOpacity(0.25))
                ]),
            child: Text(
              title,
              style: anyColorSize16(WHITE),
            ),
          ),
        ));
  }
}
