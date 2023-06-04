import 'package:firebase_database/firebase_database.dart';

class TaskModel {
  final String? id;
  final String? title;
  final String? description;
  final bool? status;

  TaskModel({this.id, this.title, this.description, this.status});

  TaskModel.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        title = snapshot.child('taskTitle').value.toString(),
        description = snapshot.child('description').value.toString(),
        status = snapshot.child('status').value as bool;

  toJson() {
    return {'taskTitle': title, 'description': description, 'status': status};
  }
}
