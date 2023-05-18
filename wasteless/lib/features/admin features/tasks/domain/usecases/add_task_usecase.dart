import 'package:dartz/dartz.dart';
import '../../../../../core/common/entity/task_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/admin_task_repo.dart';

class AddTask {
  final AdminTaskRepo _adminTaskRepo;
  AddTask(this._adminTaskRepo);
  Future<Either<Failure, Unit>> call(TaskEntity task) async {
    return await _adminTaskRepo.addTask(task);
  }
}
