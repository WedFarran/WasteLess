import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/common/data/models/task_model.dart';
import 'package:wasteless/core/strings/models_attributes.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/tasks/presentation/screens/modify_task.dart';
import 'package:wasteless/features/admin%20features/tasks/task_utils.dart';
import '../../../../../core/common/data/models/driver_models.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../../../../../core/widgets/warning_dialog.dart';
import '../widgets/assigned_task_driver.dart';
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
  late DatabaseReference dbDrivers;
  late Query todoTasks;
  DriversModel? driver;
  List<TaskModel> tasksList = [];
  List<DriversModel> driversList = [];
  @override
  void initState() {
    ref = FirebaseDatabase.instance.ref('task');
    dbDrivers = FirebaseDatabase.instance.ref('driver');
    todoTasks = ref.orderByChild('status').equalTo(false);
    getTasks();
    getDrivers();
    super.initState();
  }

  getTasks() {
    Stream<DatabaseEvent> streamBins = todoTasks.onValue;
    streamBins.listen((DatabaseEvent event) {
      Map<String, dynamic> tasksMap =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      tasksMap.forEach((key, value) {
        tasksList.add(TaskModel(
          taskId: key,
          status: value['status'],
          description: value['description'],
          dueDate: value['dueDate'],
          driverId: value['driverId'],
          location: value['location'],
          startDate: value['startDate'],
          taskTitle: value['taskTitle'],
        ));
      });
      setState(() {});
    });
  }

  getDrivers() {
    Stream<DatabaseEvent> streamDrivers = dbDrivers.onValue;
    streamDrivers.listen((DatabaseEvent event) {
      Map<String, dynamic> driversMap =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      driversMap.forEach((key, value) {
        driversList.add(DriversModel(
          id: key,
          area: value['area'],
          email: value['email'],
          fullName: value['fullName'],
          idNumber: value['idNumber'],
          image: value['image'],
          lat: value['lat'],
          lng: value['lng'],
          nationality: value['nationality'],
          qR: value['qR'],
        ));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBlueBackground(
        widget: SingleChildScrollView(
      child: Column(children: [
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
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: tasksList.length,
              itemBuilder: (BuildContext context, int i) {
                return TaskWidget(
                  deleteAction: () {
                    showDialog(
                      context: context,
                      builder: (context) => WarningDialog(
                        displayCancleButton: true,
                        displayYesButton: true,
                        title: translations(context).delete_task_confirmation,
                        yesOnTap: () {
                          try {
                            ref.child('${tasksList[i].taskId}').remove();
                          } on FirebaseException catch (e) {
                            TaskUtils.showSnackBar(e.message);
                          }
                          Navigator.of(context).pop();
                        },
                        cancleOnTap: () => Navigator.of(context).pop(),
                      ),
                    );
                  },
                  onTap: () => Navigator.pushNamed(context, ModifyTaskScreen.id,
                      arguments: {
                        TaskString.DRIVER_ID: tasksList[i].driverId,
                        TaskString.TASK_TITLE: tasksList[i].taskTitle,
                        TaskString.DUE_DATE: tasksList[i].dueDate,
                        TaskString.START_DATE: tasksList[i].startDate,
                        TaskString.LOCATION: tasksList[i].location,
                        TaskString.DESCRIPTION: tasksList[i].description,
                        TaskString.TASK_ID: tasksList[i].taskId
                      }),
                  taskDate: tasksList[i].dueDate,
                  taskName: tasksList[i].taskTitle,
                  widget: AssignedDriver(
                    driver: null,
                    driverId: tasksList[i].driverId,
                    onChanged: (value) {},
                  ),
                );
              }),
        ),
      ]),
    ));
  }
}
