part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class DoneTaskEvent extends TaskEvent {}

class NotDoneTaskEvent extends TaskEvent {}

class IsThereTaskEvent extends TaskEvent {}
