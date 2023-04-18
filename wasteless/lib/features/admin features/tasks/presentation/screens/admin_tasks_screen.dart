import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../widgets/new_task_button.dart';
import '../widgets/task_widget.dart';

class AdminTasksScreen extends StatefulWidget {
  static const String id = 'admin_tasks_screen';
  const AdminTasksScreen({super.key});

  @override
  State<AdminTasksScreen> createState() => _AdminTasksScreenState();
}

class _AdminTasksScreenState extends State<AdminTasksScreen> {
  late DatabaseReference ref1;
  late DatabaseReference ref;
  String driverName = '';
  String driverImage = '';
  @override
  void initState() {
    ref = FirebaseDatabase.instance.ref('task');
    ref1 = FirebaseDatabase.instance.ref('driver');
    super.initState();
    //getDriverName();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBlueBackground(
        widget: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NewTaskButton(
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              WASTELESS_LOGO,
              height: context.height * 0.15,
            ),
          ),
        ],
      ),
      SizedBox(
        height: context.height * 0.02,
      ),
      Flexible(
        child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (context, snapshot, animation, index) {
              getDriverName() {
                String driverId = snapshot.child('driverId').value.toString();
                Stream<DatabaseEvent> driver = ref1.child('$driverId').onValue;
                driver.listen((event) {
                  setState(() {
                    driverName =
                        event.snapshot.child('fullName').value.toString();
                    driverImage =
                        event.snapshot.child('image').value.toString();
                  });
                });
              }

              return TaskWidget(
                taskName: snapshot.child('title').value.toString(),
                taskDate: snapshot.child('dateTime').value.toString(),
                image: driverImage,
                deleteAction: () {},
                driverName: driverName,
                changeDriverAction: () {},
              );
            }),
      ),
    ]));
  }
}
