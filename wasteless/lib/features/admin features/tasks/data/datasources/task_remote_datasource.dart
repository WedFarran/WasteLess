import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/strings/database.dart';
import '../../../../../core/common/data/models/task_model.dart';
import '../../../../../core/strings/models_attributes.dart';

abstract class TaskRemoteDataResource {
  Future<List<TaskModel>> getAllTasks();
  Future<Unit> deleteTask(String taskId);
  Future<Unit> modifyTask(TaskModel task);
  Future<Unit> addTask(TaskModel task);
}

class TaskRemoteImpl implements TaskRemoteDataResource {
  final http.Client client;

  TaskRemoteImpl(this.client);
  @override
  Future<List<TaskModel>> getAllTasks() async {
    final res = await client.get(
        Uri.parse(
            "https://wasteless-36ce0-default-rtdb.asia-southeast1.firebasedatabase.app/"),
        headers: {"Content-Type": "application/json"});
    List<TaskModel> tasksList = [];
    DatabaseReference taskRef = FirebaseDatabase.instance.ref(TASK);
    Stream<DatabaseEvent> streamDrivers = taskRef.onValue;
    if (res.statusCode == 200) {
      streamDrivers.listen((DatabaseEvent event) {
        Map<String, dynamic> tasksMap =
            Map<String, dynamic>.from(event.snapshot.value as Map);

        tasksMap.forEach((key, value) {
          tasksList.add(TaskModel(
            taskId: key,
            binId: value[TaskString.BIN_ID],
            status: value[TaskString.STATUS],
            taskTitle: value[TaskString.TASK_TITLE],
            startDate: value[TaskString.START_DATE],
            dueDate: value[TaskString.DUE_DATE],
            location: value[TaskString.LOCATION],
            description: value[TaskString.DESCRIPTION],
            driverId: value[TaskString.DRIVER_ID],
          ));
        });
      });
      return Future.value(tasksList);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addTask(TaskModel task) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteTask(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> modifyTask(TaskModel task) {
    throw UnimplementedError();
  }
}
