import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wasteless/core/network/network_info.dart';
import 'package:wasteless/features/admin%20features/tasks/domain/repos/admin_task_repo.dart';
import '../../../../../core/common/data/models/task_model.dart';
import '../../../../../core/common/entity/task_entity.dart';
import '../datasources/task_local_datasource.dart';
import '../datasources/task_remote_datasource.dart';

class AdminTaskRepoImpl implements AdminTaskRepo {
  final TaskRemoteDataResource taskRemoteDataResource;
  final TaskLocalDataResource taskLocalDataResource;
  final NetworkInfo networkInfo;
  AdminTaskRepoImpl(
      {required this.taskLocalDataResource,
      required this.taskRemoteDataResource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = taskRemoteDataResource.getAllTasks();
        taskLocalDataResource.cacheTasks(remoteTasks as List<TaskModel>);
        return Right(remoteTasks as List<TaskEntity>);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await taskLocalDataResource.getCachedTasks();
        return Right(localTasks.cast<TaskEntity>());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addTask(TaskEntity task) async {
    final TaskModel taskModel = TaskModel(
        taskId: task.taskId,
        binId: task.binId,
        location: task.location,
        status: task.status,
        taskTitle: task.taskTitle,
        startDate: task.startDate,
        dueDate: task.dueDate,
        description: task.description,
        driverId: task.driverId);
    if (await networkInfo.isConnected) {
      try {
        taskRemoteDataResource.addTask(taskModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(String taskId) async {
    if (await networkInfo.isConnected) {
      try {
        taskRemoteDataResource.deleteTask(taskId);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> modifyTask(TaskEntity task) async {
    final TaskModel taskModel = TaskModel(
        taskId: task.taskId,
        binId: task.binId,
        location: task.location,
        status: task.status,
        taskTitle: task.taskTitle,
        startDate: task.startDate,
        dueDate: task.dueDate,
        description: task.description,
        driverId: task.driverId);
    if (await networkInfo.isConnected) {
      try {
        taskRemoteDataResource.modifyTask(taskModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  /*_gerMessage()async{
      if (await networkInfo.isConnected) {
      try {
        taskRemoteDataResource.modifyTask(taskModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }*/
}
