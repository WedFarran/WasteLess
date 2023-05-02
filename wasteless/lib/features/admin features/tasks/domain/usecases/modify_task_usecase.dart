import 'package:dartz/dartz.dart';
import '../../../../../core/common/domain/entity/task_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/admin_task_repo.dart';

class ModifyTask {
  final AdminTaskRepo _adminTaskRepo;
  ModifyTask(this._adminTaskRepo);
  Future<Either<Failure, Unit>> call(TaskEntity task) async {
    return await _adminTaskRepo.modifyTask(task);
  }
}
