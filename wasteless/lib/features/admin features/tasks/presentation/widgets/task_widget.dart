import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class TaskWidget extends StatelessWidget {
  final String taskName;
  final Function()? deleteAction;
  final String taskDate;
  final Function()? changeDriverAction;
  final String image;
  final String driverName;
  const TaskWidget({
    required this.taskName,
    required this.deleteAction,
    required this.taskDate,
    required this.changeDriverAction,
    required this.image,
    required this.driverName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: context.height * 0.18,
        width: context.width * 0.8,
        decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: BLACK.withOpacity(0.25))
            ]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
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
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  taskDate,
                  style: const TextStyle(
                      fontFamily: 'Nunito', fontSize: 9, color: PRIMARY_BLUE),
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
          InkWell(
            onTap: changeDriverAction,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 25,
                ),
              ),
              SizedBox(
                width: context.width * 0.05,
              ),
              Text(
                driverName,
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 11,
                    color: PRIMARY_BLUE,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: context.width * 0.3,
              ),
              const Icon(
                Icons.arrow_downward_outlined,
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
