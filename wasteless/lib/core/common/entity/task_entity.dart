import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String taskId;
  final String binId;
  final double location;
  final bool status;
  final double taskTitle;
  final String startDate;
  final String dueDate;
  final String driverId;
  final String description;

  const TaskEntity({
    required this.taskId,
    required this.binId,
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
        binId,
        location,
        status,
        taskTitle,
        startDate,
        dueDate,
        description,
        driverId
      ];
}
