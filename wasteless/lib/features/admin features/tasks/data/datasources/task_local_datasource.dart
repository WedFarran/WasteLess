import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/strings/database.dart';
import '../../../../../core/common/data/models/task_model.dart';

abstract class TaskLocalDataResource {
  Future<List<TaskModel>> getCachedTasks();
  Future<Unit> cacheTasks(List<TaskModel> tasks);
}

class TaskLocalDataResourceImpl implements TaskLocalDataResource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataResourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cacheTasks(List<TaskModel> tasks) {
    List taskModelToJson = tasks
        .map<Map<String, dynamic>>((taskModel) => taskModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_TASKS, json.encode(taskModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<TaskModel>> getCachedTasks() {
    final jsonString = sharedPreferences.getString(CACHED_TASKS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<TaskModel> jsonToTaskModel = decodeJsonData
          .map<TaskModel>((jsonTaskModel) => TaskModel.fromJson(jsonTaskModel))
          .toList();

      return Future.value(jsonToTaskModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
