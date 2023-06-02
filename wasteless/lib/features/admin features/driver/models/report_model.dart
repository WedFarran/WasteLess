import '../entities/report_entity.dart';

class ReportModel extends ReportEntity {
  const ReportModel(
      {required super.driverId,
      required super.id,
      required super.reportFile,
      required super.details,
      required super.date,
      required super.taskTitle,
      required super.taskid,
      required super.wasteype,
      required super.wastewight});

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
        date: json['date'],
        driverId: json['driverId'],
        id: json['id'],
        reportFile: json['reportFile'],
        taskid: json['taskid'],
        taskTitle: json['taskTitle'],
        details: json['details'],
        wasteype: json['wastetype'],
        wastewight: json['wastewight']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'taskid': taskid,
      'reportFile': reportFile,
      'driverId': driverId,
      'date': date
    };
  }
}
