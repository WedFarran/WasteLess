// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class TaskWidget extends StatelessWidget {
  final String taskName;
  final Function()? deleteAction;
  final String taskDate;
  final Function()? onTap;
  final Widget widget;
  const TaskWidget(
      {super.key,
      required this.taskName,
      required this.deleteAction,
      required this.taskDate,
      required this.onTap,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height * 0.23,
        width: context.width * 0.8,
        margin: const EdgeInsets.only(top: 30, bottom: 20, right: 30, left: 30),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: BLACK.withOpacity(0.25))
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      taskName,
                      style: anyColorSize16(PRIMARY_BLUE),
                    ),
                  ),
                  IconButton(
                    onPressed: deleteAction,
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: PRIMARY_BLUE,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      taskDate,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 9,
                          color: PRIMARY_BLUE),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: PRIMARY_BLUE,
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: PRIMARY_BLUE,
              ),
              widget,
            ]),
      ),
    );
  }
}
