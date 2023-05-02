import '../../../strings/models_attributes.dart';
import '../../domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
      {required super.taskId,
      required super.binId,
      required super.lat,
      required super.lng,
      required super.status,
      required super.taskTitle,
      required super.startDate,
      required super.dueDate,
      required super.description,
      required super.driverId});

  factory TaskModel.fromMap(Map<dynamic, dynamic> map) {
    return TaskModel(
        taskId: map[TaskString.TASK_ID],
        binId: map[TaskString.BIN_ID],
        lat: map[TaskString.LAT],
        lng: map[TaskString.LNG],
        status: map[TaskString.STATUS],
        taskTitle: map[TaskString.TASK_TITLE],
        startDate: map[TaskString.START_DATE],
        dueDate: map[TaskString.DUE_DATE],
        description: map[TaskString.DESCRIPTION],
        driverId: map[TaskString.DRIVER_ID]);
  }

  factory TaskModel.fromJson(Map<dynamic, dynamic> json) {
    return TaskModel(
        taskId: json[TaskString.TASK_ID],
        binId: json[TaskString.BIN_ID],
        lat: json[TaskString.LAT],
        lng: json[TaskString.LNG],
        status: json[TaskString.STATUS],
        taskTitle: json[TaskString.TASK_TITLE],
        startDate: json[TaskString.START_DATE],
        dueDate: json[TaskString.DUE_DATE],
        description: json[TaskString.DESCRIPTION],
        driverId: json[TaskString.DRIVER_ID]);
  }

  Map<String, dynamic> toJson() {
    return {
      TaskString.BIN_ID: binId,
      TaskString.LAT: lat,
      TaskString.LNG: lng,
      TaskString.STATUS: status,
      TaskString.TASK_TITLE: taskTitle,
      TaskString.START_DATE: startDate,
      TaskString.DUE_DATE: dueDate,
      TaskString.DESCRIPTION: description,
      TaskString.DRIVER_ID: driverId,
    };
  }
}
