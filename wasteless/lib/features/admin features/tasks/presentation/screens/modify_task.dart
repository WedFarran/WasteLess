import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/common/data/models/driver_models.dart';
import '../../../../../core/strings/models_attributes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/widgets/logo_back_widget.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../../../../../core/widgets/text_field.dart';
import '../../../../../core/widgets/warning_dialog.dart';
import '../../task_utils.dart';
import '../widgets/add_or_modify_task_button_widget.dart';
import '../widgets/assigned_task_driver.dart';
import '../widgets/dates_widgets.dart';
import '../widgets/drivers_dropdown_menu.dart';
import 'admin_tasks_screen.dart';

final _formKey = GlobalKey<FormState>();

class ModifyTaskScreen extends StatefulWidget {
  static const String id = 'ModifyTaskScreen';
  const ModifyTaskScreen({super.key});

  @override
  State<ModifyTaskScreen> createState() => _ModifyTaskScreenState();
}

class _ModifyTaskScreenState extends State<ModifyTaskScreen> {
  String startDate = '';
  String dueDate = '';
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool start = false;
  bool due = false;

  late DatabaseReference dbTasks;

  DriversModel? driver;
  String? title;

  bool driverSelected = false;
  bool titleSelected = false;
  @override
  void initState() {
    dbTasks = FirebaseDatabase.instance.ref('task');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskTitle = TextEditingController();
    final location = TextEditingController();
    final description = TextEditingController();
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    taskTitle.text = arguments[TaskString.TASK_TITLE];
    location.text = arguments[TaskString.LOCATION];
    String initialStartDate = arguments[TaskString.START_DATE];
    String initialDueDate = arguments[TaskString.DUE_DATE];
    String driverId = arguments[TaskString.DRIVER_ID];
    description.text = arguments[TaskString.DESCRIPTION];
    String taskId = arguments[TaskString.TASK_ID];

    DatabaseReference child = dbTasks.child(taskId);
    return ScaffoldBlueBackground(
      widget: SingleChildScrollView(
        child: Column(children: [
          const LogoBackButton(),
          Form(
              key: _formKey,
              child: Column(children: [
                WasteLessTextField(
                    title: translations(context).task_title,
                    color: WHITE,
                    hintColor: GREY,
                    textController: _titleController.text.isEmpty
                        ? taskTitle
                        : _titleController,
                    obscureText: false,
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return translations(context).enter_task_title_error;
                      }
                      return null;
                    }),
                WasteLessTextField(
                    title: translations(context).location,
                    color: WHITE,
                    hintColor: GREY,
                    textController: _locationController.text.isEmpty
                        ? location
                        : _locationController,
                    obscureText: false,
                    validator: (location) {
                      if (location == null || location.isEmpty) {
                        return translations(context).enter_location_error;
                      }
                      return null;
                    }),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin:
                      const EdgeInsets.only(bottom: 13, left: 20, right: 20),
                  width: context.width * 0.88,
                  height: context.height * 0.085,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: WHITE,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 3.5),
                            blurRadius: 4,
                            color: BLACK.withOpacity(0.25))
                      ]),
                  child: AssignedDriver(
                    driverId: driverId,
                    onChanged: (value) {
                      setState(() {
                        driver = value;
                      });
                    },
                    driver: driver,
                  ),
                ),
                SelectDatesWidgets(
                  dateError: false,
                  dueDate: dueDate.isEmpty ? initialDueDate : dueDate,
                  dueDateEmpty: translations(context).due,
                  setDueTaskDate: _setDueTaskDate,
                  setStartTaskDate: _setStartTaskDate,
                  startDate: startDate.isEmpty ? initialStartDate : startDate,
                  startDateEmpty: translations(context).start,
                  start: start,
                  due: due,
                ),
                WasteLessTextField(
                    title: translations(context).tap_to_add_a_description,
                    color: WHITE,
                    hintColor: GREY,
                    textController: _descriptionController.text.isEmpty
                        ? description
                        : _descriptionController,
                    obscureText: false,
                    height: 0.2,
                    validator: (p0) => null)
              ])),
          AddOrModifyTaskButtonWidget(
              title: translations(context).modify,
              onTap: () async {
                final formIsValid = _formKey.currentState!.validate();
                if (formIsValid) {
                  showDialog(
                    context: context,
                    builder: (context) => WarningDialog(
                      displayCancleButton: true,
                      displayYesButton: true,
                      title: translations(context).modify_task_confirmation,
                      yesOnTap: () async {
                        try {
                          await child.update({
                            TaskString.START_DATE: startDate.isEmpty
                                ? initialStartDate
                                : startDate,
                            TaskString.DESCRIPTION: _descriptionController
                                    .text.isEmpty
                                ? description.text.trim().toString()
                                : _descriptionController.text.trim().toString(),
                            TaskString.DRIVER_ID: driver == null
                                ? driverId
                                : driver!.id.toString(),
                            TaskString.DUE_DATE:
                                dueDate.isEmpty ? initialDueDate : dueDate,
                            TaskString.TASK_TITLE: _titleController.text.isEmpty
                                ? taskTitle.text.trim().toString()
                                : _titleController.text.trim().toString(),
                            TaskString.LOCATION: _locationController
                                    .text.isEmpty
                                ? location.text.trim().toString()
                                : _locationController.text.trim().toString(),
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AdminTasksScreen.id,
                              (Route<dynamic> route) => false);
                        } on FirebaseException catch (e) {
                          TaskUtils.showSnackBar(e.message);
                        }
                      },
                      cancleOnTap: () => Navigator.of(context).pop(),
                    ),
                  );
                  // ignore: use_build_context_synchronously
                  // Navigator.pop(context);
                }
              })
        ]),
      ),
      child: const Padding(padding: EdgeInsets.all(0)),
    );
  }

  _setDueTaskDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2024))
        .then((value) {
      setState(() {
        due = false;
        dueDate = DateFormat("yyyy-MM-dd").format(value!).toString();
      });
    });
  }

  _setStartTaskDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2024))
        .then((value) {
      setState(() {
        start = false;
        startDate = DateFormat("yyyy-MM-dd").format(value!).toString();
      });
    });
  }
}
