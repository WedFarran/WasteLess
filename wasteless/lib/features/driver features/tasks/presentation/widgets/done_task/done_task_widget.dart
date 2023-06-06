import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasteless/core/utils/colors.dart';
import '../../screens/driver_task_screen.dart';
import '../task_card.dart';

class DoneTaskWidget extends StatelessWidget {
  const DoneTaskWidget({
    super.key,
    required this.query,
  });

  final Query query;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Done',
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
                      return snapshot.child('status').value == true
                          ? TaskCard(
                              title:
                                  snapshot.child('taskTitle').value.toString(),
                              description: snapshot
                                  .child('description')
                                  .value
                                  .toString(),
                              isShowBottomSheet: false,
                              checkBoxValue:
                                  snapshot.child('status').value as bool,
                              onChanged: (val) {
                                final vlRef = FirebaseDatabase.instance
                                    .ref()
                                    .child('task')
                                    .child(snapshot.key.toString());

                                vlRef.update({"status": false});
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DriverTaskScreen(),
                                  ),
                                );
                              },
                            )
                          : const SizedBox();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
