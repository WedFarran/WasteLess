import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';

import 'driver_tasks_screen.dart';

enum WasteType { dangerous, general }

class ReportScreen extends StatefulWidget {
  static const String id = 'report_screen';

  const ReportScreen({
    super.key,
    this.driverId,
    this.taskId,
    this.taskName,
  });
  final String? driverId;
  final String? taskId;
  final String? taskName;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  WasteType? _wasteType = WasteType.general;
  TextEditingController wasteWightController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  String wasteType = 'General';
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('report');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  'Bin Report',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Waste Type',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),

              //Waste Type
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return PRIMARY_BLUE;
                            }
                            return PRIMARY_GREEN;
                          },
                        ),
                        value: WasteType.dangerous,
                        groupValue: _wasteType,
                        onChanged: (value) {
                          setState(() {
                            _wasteType = value;
                            wasteType = "Dangerous";
                          });
                        }),
                  ),
                  const Text('Dangerous'),
                  const SizedBox(
                    width: 55,
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return PRIMARY_BLUE;
                            }
                            return PRIMARY_GREEN;
                          },
                        ),
                        value: WasteType.general,
                        groupValue: _wasteType,
                        onChanged: (value) {
                          setState(() {
                            _wasteType = value;
                          });
                        }),
                  ),
                  const Text('General')
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Waste Wight',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  controller: wasteWightController,
                  style: const TextStyle(color: BLACK),
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                      hintText: "Waste Wight",
                      hintStyle: TextStyle(color: GREY),
                      filled: true,
                      fillColor: EXTRA_LIGHT_BLUE,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              const Text(
                'Other Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  controller: detailsController,
                  style: const TextStyle(color: BLACK),
                  maxLines: 14,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                      hintText: "Details...",
                      hintStyle: TextStyle(color: GREY),
                      filled: true,
                      fillColor: EXTRA_LIGHT_BLUE,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Center(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minWidth: 300.0,
                    height: 45,
                    color: PRIMARY_GREEN,
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const DriverTasksScreen(),
                      ));
                      Map<String, dynamic> report = {
                        'wastetype': wasteType,
                        'wastewight': wasteWightController.text,
                        'details': detailsController.text,
                        'driverId': widget.driverId,
                        'taskId': widget.taskId,
                        'taskName': widget.taskName,
                        'dateTime':
                            '${DateTime.now().year} - ${DateTime.now().month}'
                      };
                      await dbRef.push().set(report);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
