import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/driver/data/models/report_model.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';

class DriverHistoryScreen extends StatelessWidget {
  static const String id = 'DriverHistoryScreen';
  const DriverHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> driverInformation =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String driverId = driverInformation['driverId'];
    DatabaseReference ref = FirebaseDatabase.instance.ref('report');
    Query result = ref.orderByChild('driverId').equalTo(driverId);
    return ScaffoldBlueBackground(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: PRIMARY_GREEN,
                    )),
                Image.asset(
                  WASTELESS_LOGO_TRANS,
                  height: context.height * 0.15,
                )
              ],
            ),
          ),
          SizedBox(height: context.height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(driverInformation['image']),
                  backgroundColor: WHITE,
                  radius: 50,
                ),
                Text(
                  '${driverInformation['fullName']}\n  ${driverInformation['idNumber']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: PRIMARY_BLUE,
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: context.height * 0.05),
          StreamBuilder(
              stream: result.onValue,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                Map<String, dynamic> reportsMap =
                    snapshot.data!.snapshot.value == null
                        ? {}
                        : Map<String, dynamic>.from(
                            snapshot.data!.snapshot.value as Map);
                List<ReportModel> reportsList = [];
                reportsMap.forEach((key, value) {
                  reportsList.add(ReportModel(
                      id: key,
                      dateTime: value['dateTime'],
                      driverId: value['driverId'],
                      reportFile: value['reportFile'],
                      taskId: value['taskId'],
                      taskName: value['taskName']));
                });

                if (reportsMap.isEmpty) {
                  return Text(translations(context).empty_reports);
                }
                List<DataRow> rows = [];

                reportsMap.forEach(
                  (key, value) {
                    rows.add(DataRow(cells: [
                      DataCell(Text(value['taskName'])),
                      DataCell(Text(value['dateTime'])),
                      DataCell(IconButton(
                        icon: const Icon(Icons.download_rounded),
                        onPressed: () =>
                            downloadFile(value['reportFile'], context),
                      ))
                    ]));
                  },
                );
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text(translations(context).task_name,
                              style: anyColorSize16(PRIMARY_GREEN))),
                      DataColumn(
                          label: Text(translations(context).date_time,
                              style: anyColorSize16(PRIMARY_GREEN))),
                      DataColumn(
                          label: Text(translations(context).report,
                              style: anyColorSize16(PRIMARY_GREEN))),
                    ],
                    rows: rows,
                  ),
                );
              }),
        ],
      ),
    );
  }

  downloadFile(value, context) async {
    final tempDir = await getTemporaryDirectory();
    await Dio().download(value, tempDir.path);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('downloaded')));
  }
}
