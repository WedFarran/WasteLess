import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String taskId;

  final String description;
  final String driverId;
  final String dueDate;
  final String location;
  final String startDate;
  final bool status;
  final String taskTitle;

  const TaskEntity({
    required this.taskId,
    required this.location,
    required this.status,
    required this.taskTitle,
    required this.startDate,
    required this.dueDate,
    required this.description,
    required this.driverId,
  });
  @override
  List<Object?> get props => [
        taskId,
        location,
        status,
        taskTitle,
        startDate,
        dueDate,
        description,
        driverId
      ];
}
