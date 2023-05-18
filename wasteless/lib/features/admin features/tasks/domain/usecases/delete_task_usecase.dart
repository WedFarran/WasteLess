import 'package:dartz/dartz.dart';
import '../../../../../core/common/entity/task_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/admin_task_repo.dart';

class DeleteTask {
  final AdminTaskRepo _adminTaskRepo;
  DeleteTask(this._adminTaskRepo);
  Future<Either<Failure, Unit>> call(TaskEntity taskId) async {
    return await _adminTaskRepo.modifyTask(taskId);
  }
}
