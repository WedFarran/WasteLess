import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/strings/models_attributes.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/tasks/presentation/screens/modify_task.dart';
import 'package:wasteless/features/admin%20features/tasks/task_utils.dart';
import '../../../../../core/common/data/models/driver_models.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../../../../../core/widgets/warning_dialog.dart';
import '../widgets/new_task_button.dart';
import '../widgets/task_widget.dart';
import 'add_task.dart';

class AdminTasksScreen extends StatefulWidget {
  static const String id = 'admin_tasks_screen';
  const AdminTasksScreen({super.key});

  @override
  State<AdminTasksScreen> createState() => _AdminTasksScreenState();
}

class _AdminTasksScreenState extends State<AdminTasksScreen> {
  late DatabaseReference ref;
  late Query todoTasks;
  DriversModel? driver;
  @override
  void initState() {
    ref = FirebaseDatabase.instance.ref('task');
    todoTasks = ref.orderByChild(TaskString.STATUS).equalTo(false);
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
              onTap: () => Navigator.pushNamed(context, AddTaskScreen.id),
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
                query: todoTasks,
                defaultChild: const Center(
                  child: CircularProgressIndicator(),
                ),
                itemBuilder: (context, snapshot, animation, index) {
                  List<DriversModel?> items =
                      List.filled(snapshot.children.length, driver);

                  return TaskWidget(
                      onTap: () => Navigator.pushNamed(
                              context, ModifyTaskScreen.id, arguments: {
                            TaskString.DRIVER_ID: snapshot
                                .child(TaskString.DRIVER_ID)
                                .value
                                .toString(),
                            TaskString.TASK_TITLE: snapshot
                                .child(TaskString.TASK_TITLE)
                                .value
                                .toString(),
                            TaskString.DUE_DATE: snapshot
                                .child(TaskString.DUE_DATE)
                                .value
                                .toString(),
                            TaskString.START_DATE: snapshot
                                .child(TaskString.START_DATE)
                                .value
                                .toString(),
                            TaskString.LOCATION: snapshot
                                .child(TaskString.LOCATION)
                                .value
                                .toString(),
                            TaskString.DESCRIPTION: snapshot
                                .child(TaskString.DESCRIPTION)
                                .value
                                .toString(),
                            TaskString.TASK_ID: snapshot.key
                          }),
                      taskName: snapshot
                          .child(TaskString.TASK_TITLE)
                          .value
                          .toString(),
                      taskDate:
                          snapshot.child(TaskString.DUE_DATE).value.toString(),
                      deleteAction: () {
                        showDialog(
                          context: context,
                          builder: (context) => WarningDialog(
                            displayCancleButton: true,
                            displayYesButton: true,
                            title:
                                translations(context).delete_task_confirmation,
                            yesOnTap: () {
                              try {
                                ref.child('${snapshot.key}').remove();
                              } on FirebaseException catch (e) {
                                TaskUtils.showSnackBar(e.message);
                              }
                              Navigator.of(context).pop();
                            },
                            cancleOnTap: () => Navigator.of(context).pop(),
                          ),
                        );
                      },
                      widget:
                          Container() /*AssignedDriver(
                    driverId:
                        snapshot.child(TaskString.DRIVER_ID).value.toString(),
                    onChanged: (value) {},
                    driver: driver,
                  ),*/
                      );
                }),
          ),
        ),
      ]),
      child: const Padding(padding: EdgeInsets.all(0)),
    );
  }
}
