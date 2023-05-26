import 'package:equatable/equatable.dart';

class ReportEntity extends Equatable {
  final String id;
  final String driverId;
  final String taskId;
  final String reportFile;
  final String dateTime;
  final String taskName;
  const ReportEntity(
      {required this.dateTime,
      required this.driverId,
      required this.id,
      required this.reportFile,
      required this.taskId,
      required this.taskName});
  @override
  List<Object?> get props =>
      [id, dateTime, driverId, reportFile, taskId, taskName];
}
