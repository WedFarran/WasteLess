import '../../domain/entities/report_entity.dart';

class ReportModel extends ReportEntity {
  const ReportModel(
      {required super.dateTime,
      required super.driverId,
      required super.id,
      required super.reportFile,
      required super.taskId,
      required super.taskName});

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
        dateTime: json['dateTime'],
        driverId: json['driverId'],
        id: json['id'],
        reportFile: json['reportFile'],
        taskId: json['taskId'],
        taskName: json['taskName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'taskId': taskId,
      'reportFile': reportFile,
      'driverId': driverId,
      'dateTime': dateTime
    };
  }
}
