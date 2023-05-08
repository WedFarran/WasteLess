import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/utils/styles.dart';

class SelectDatesWidgets extends StatelessWidget {
  final Function()? setStartTaskDate;
  final Function()? setDueTaskDate;
  final String startDate;
  final String startDateEmpty;
  final String dueDate;
  final String dueDateEmpty;
  final bool dateError;
  final bool start;
  final bool due;
  const SelectDatesWidgets(
      {super.key,
      required this.setStartTaskDate,
      required this.setDueTaskDate,
      required this.dateError,
      required this.dueDate,
      required this.dueDateEmpty,
      required this.startDate,
      required this.startDateEmpty,
      required this.start,
      required this.due});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        width: context.width * 0.88,
        height: context.height * 0.09,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3.5),
                  blurRadius: 4,
                  color: BLACK.withOpacity(0.25))
            ]),
        child: Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              color: GREY,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 3, bottom: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: setStartTaskDate,
                    child: Text(
                      startDate == '' ? startDateEmpty : startDate,
                      style: anyColorSize16(GREY),
                    ),
                  ),
                  InkWell(
                    onTap: setDueTaskDate,
                    child: Text(
                      dueDate == '' ? dueDateEmpty : dueDate,
                      style: anyColorSize16(GREY),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: context.width * 0.03),
            Visibility(
              visible: dateError,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  start
                      ? translations(context).select_start_date
                      : due
                          ? translations(context).select_due_date
                          : translations(context).select_dates,
                  style: anyColorSize16(RED),
                ),
              ),
            ),
          ],
        ));
  }
}
