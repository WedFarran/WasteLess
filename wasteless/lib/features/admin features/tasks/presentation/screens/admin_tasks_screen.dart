import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../widgets/new_task_button.dart';
import '../widgets/task_widget.dart';
import 'add_or_modify_task.dart';

class AdminTasksScreen extends StatefulWidget {
  static const String id = 'admin_tasks_screen';
  const AdminTasksScreen({super.key});

  @override
  State<AdminTasksScreen> createState() => _AdminTasksScreenState();
}

class _AdminTasksScreenState extends State<AdminTasksScreen> {
  late DatabaseReference ref;

  @override
  void initState() {
    ref = FirebaseDatabase.instance.ref('task');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBlueBackground(
        widget: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NewTaskButton(
            onTap: () => Navigator.pushNamed(context, AddOrModifyTaskScreen.id),
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: FirebaseAnimatedList(
              query: ref,
              defaultChild: const Center(
                child: CircularProgressIndicator(),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                return TaskWidget(
                  onTap: () {},
                  taskName: snapshot.child('taskTitle').value.toString(),
                  taskDate: snapshot.child('dueDate').value.toString(),
                  deleteAction: () {},
                  driverId: snapshot.child('driverId').value.toString(),
                );
              }),
        ),
      ),
    ]));
  }
}
