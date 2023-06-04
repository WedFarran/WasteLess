import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TaskReportModel {
  final String? taskId;
  final String? taskTitle;
  final TextEditingController wasteWightController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  TaskReportModel({this.taskId, this.taskTitle});

  TaskReportModel.fromSnapshot(DataSnapshot snapshot)
      : taskId = snapshot.key,
        taskTitle = snapshot.child('taskTitle').value.toString();

  toJson(String wasteType) {
    return {
      'wastetype': wasteType,
      'wastewight': wasteWightController.text,
      'details': detailsController.text,
      'taskid': taskId,
      'taskTitle': taskTitle,
      'date': '${DateTime.now().year} - ${DateTime.now().month}'
    };
  }
}
