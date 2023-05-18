import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasteless/core/utils/colors.dart';

import '../../../../../admin features/driver/data/models/report_model.dart';
import '../../bloc/task_bloc.dart';
import '../../screens/report_screen.dart';
import '../done_task/done_task_widget.dart';
import '../task_card.dart';

class ToDoTaskWidget extends StatelessWidget {
  const ToDoTaskWidget({super.key, required this.query});
  final Query query;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ToDo',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: PRIMARY_GREEN),
            ),
            Flexible(
              child: SizedBox(
                child: FirebaseAnimatedList(
                    query: query,
                    itemBuilder: (context, snapshot, animation, index) {
                      return snapshot.child('status').value == false
                          ? TaskCard(
                              title:
                                  snapshot.child('taskTitle').value.toString(),
                              description: snapshot
                                  .child('description')
                                  .value
                                  .toString(),
                              isShowBottomSheet: true,
                              checkBoxValue:
                                  snapshot.child('status').value as bool,
                              onChanged: (val) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReportScreen(
                                        reportModel:
                                            TaskReportModel.fromSnapshot(
                                                snapshot)),
                                  ),
                                );
                              },
                            )
                          : const SizedBox();
                    }),
              ),
            ),

            //* Call Done Task if there
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is IsThereTaskState) {
                  return DoneTaskWidget(query: query);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
