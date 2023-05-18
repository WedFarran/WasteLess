import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReportModel {
  final String? taskId;
  final String? taskTitle;
  final TextEditingController wasteWightController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  ReportModel(
      {this.taskId,
      this.taskTitle,
      required String id,
      required dateTime,
      required driverId,
      required reportFile,
      required taskName});

  ReportModel.fromSnapshot(DataSnapshot snapshot)
      : taskId = snapshot.key,
        taskTitle = snapshot.child('taskTitle').value.toString();

  toJson(String wasteType) {
    return {
      'wastetype': wasteType,
      'wastewight': wasteWightController.text,
      'details': detailsController.text,
      'taskId': taskId,
      'taskName': taskTitle,
      'dateTime': '${DateTime.now().year} - ${DateTime.now().month}'
    };
  }
}
