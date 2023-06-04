part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class StatusValueFalseState extends TaskState {
  final bool status;

  StatusValueFalseState(this.status);
}

class StatusValueTrueState extends TaskState {
  final bool status;

  StatusValueTrueState(this.status);
}

class IsThereTaskState extends TaskState {
  final bool status;

  IsThereTaskState(this.status);
}
