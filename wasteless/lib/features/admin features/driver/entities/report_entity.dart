import 'package:equatable/equatable.dart';

class ReportEntity extends Equatable {
  final String id;
  final String date;
  final String details;
  final String driverId;
  final String reportFile;
  final String taskTitle;
  final String taskid;
  final String wasteype;
  final String wastewight;
  const ReportEntity({
    required this.id,
    required this.date,
    required this.details,
    required this.driverId,
    required this.reportFile,
    required this.taskTitle,
    required this.taskid,
    required this.wasteype,
    required this.wastewight,
  });
  @override
  List<Object?> get props => [
        id,
        date,
        driverId,
        reportFile,
        details,
        taskTitle,
        taskid,
        wasteype,
        wastewight
      ];
}
