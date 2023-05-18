import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/failure.dart';
import '../../../../../core/common/entity/task_entity.dart';

abstract class AdminTaskRepo {
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, Unit>> addTask(TaskEntity task);
  Future<Either<Failure, Unit>> deleteTask(String taskId);
  Future<Either<Failure, Unit>> modifyTask(TaskEntity task);
}
