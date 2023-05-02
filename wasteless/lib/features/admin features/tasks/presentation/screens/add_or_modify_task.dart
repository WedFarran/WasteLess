import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteless/core/strings/database.dart';
import 'package:wasteless/core/utils/language.dart';
import '../../../../../core/strings/models_attributes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/logo_back_widget.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../../../../../core/widgets/text_field.dart';
import '../../../map/data/models/driver_models.dart';
import '../widgets/add_or_modify_task_button_widget.dart';
import '../widgets/dates_widgets.dart';
import '../widgets/drivers_dropdown_menu.dart';

class AddOrModifyTaskScreen extends StatefulWidget {
  static const String id = 'AddOrModifyTaskScreen';
  const AddOrModifyTaskScreen({super.key});

  @override
  State<AddOrModifyTaskScreen> createState() => _AddOrModifyTaskScreenState();
}

final _formKey = GlobalKey<FormState>();

class _AddOrModifyTaskScreenState extends State<AddOrModifyTaskScreen> {
  String dueDate = '';
  String startDate = '';

  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool dateError = false;

  late DatabaseReference dbDrivers;
  late DatabaseReference dbTasks;

  List<DriversModel> driversList = [];

  DriversModel? driver;
  String? title;

  bool driverSelected = false;
  bool titleSelected = false;

  @override
  void initState() {
    dbDrivers = FirebaseDatabase.instance.ref(DRIVER);
    dbTasks = FirebaseDatabase.instance.ref().child(TASK);
    getDrivers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBlueBackground(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            const LogoBackButton(),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    WasteLessTextField(
                      title: translations(context).task_title,
                      color: WHITE,
                      hintColor: GREY,
                      textController: _titleController,
                      obscureText: false,
                      validator: (title) {
                        if (title == null || title.isEmpty) {
                          return translations(context).enter_task_title_error;
                        }
                        return null;
                      },
                    ),
                    WasteLessTextField(
                      title: translations(context).location,
                      color: WHITE,
                      hintColor: GREY,
                      textController: _locationController,
                      obscureText: false,
                      validator: (location) {
                        if (location == null || location.isEmpty) {
                          return translations(context).enter_location_error;
                        }
                        return null;
                      },
                    ),
                    DriverDropDownMenu(
                      onChanged: (driver) {
                        this.driver = driver;

                        setState(() {
                          driverSelected = this.driver == null
                              ? driverSelected = true
                              : false;
                        });
                      },
                      value: driver,
                      itemsList: driversList,
                      itemSelected: driverSelected,
                    ),
                    SelectDatesWidgets(
                      dateError: dateError,
                      dueDate: dueDate,
                      dueDateEmpty: translations(context).due,
                      setDueTaskDate: _setDueTaskDate,
                      setStartTaskDate: _setStartTaskDate,
                      startDate: startDate,
                      startDateEmpty: translations(context).start,
                    ),
                    WasteLessTextField(
                      title: translations(context).tap_to_add_a_description,
                      color: WHITE,
                      hintColor: GREY,
                      textController: _descriptionController,
                      obscureText: false,
                      height: 0.2,
                      validator: (p0) => null,
                    ),
                  ],
                )),
            AddOrModifyTaskButtonWidget(
              title: translations(context).save,
              onTap: () async {
                final formIsValid = _formKey.currentState!.validate();
                if (!formIsValid) {}

                if (dueDate.isEmpty || startDate.isEmpty) {
                  setState(() {
                    dateError = true;
                  });
                } else if (dueDate.isNotEmpty || startDate.isNotEmpty) {
                  setState(() {
                    dateError = false;
                  });
                }
                if (driver == null) {
                  setState(() {
                    driverSelected = true;
                  });
                }

                if (title == null) {
                  setState(() {
                    titleSelected = true;
                  });
                }
                if (formIsValid &&
                    dateError == false &&
                    driverSelected == false) {
                  await dbTasks.push().set({
                    TaskString.BIN_ID: '',
                    TaskString.START_DATE: startDate,
                    TaskString.DESCRIPTION: _descriptionController.text.trim(),
                    TaskString.DRIVER_ID: driver!.id.toString(),
                    TaskString.DUE_DATE: dueDate,
                    TaskString.STATUS: "false",
                    TaskString.TASK_TITLE: title
                  });
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
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
        dueDate = DateFormat("yyyy-MM-dd").format(value!).toString();
      });
    });
    setState(() {
      dateError = dueDate.isEmpty ? true : false;
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
        startDate = DateFormat("yyyy-MM-dd").format(value!).toString();
        dateError = startDate.isEmpty ? true : false;
      });
    });
  }

  void getDrivers() {
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
            location: value['location']));
      });
      setState(() {});
    });
  }
}
