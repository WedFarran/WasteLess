import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import '../../../../admin features/driver/data/models/report_model.dart';
import '../pdf_file.dart';
import '../widgets/text_form_field.dart';

enum WasteType { dangerous, general }

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    super.key,
    this.reportModel,
  });
  final TaskReportModel? reportModel;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  WasteType? _wasteType = WasteType.general;

  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('report');
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String wasteType = translations(context).general;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(30.0),
          child: ListView(
            children: [
              Center(
                child: Text(
                  translations(context).bin_report,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                translations(context).waste_type,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              //Waste Type
              Row(
                children: [
                  //Dangerous Radio Button
                  _radioButton(
                    groupValue: _wasteType,
                    value: WasteType.dangerous,
                    onChanged: ((value) {
                      setState(() {
                        _wasteType = value;
                        wasteType = 'Dangerous';
                      });
                    }),
                  ),
                  Text(translations(context).dangerous),
                  SizedBox(
                    width: 90.w,
                  ),
                  //General Radio Button
                  _radioButton(
                    groupValue: _wasteType,
                    value: WasteType.general,
                    onChanged: ((value) {
                      setState(() {
                        _wasteType = value;
                      });
                    }),
                  ),
                  Text(translations(context).general)
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                translations(context).waste_weight,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),

              MyTextFormField(
                controller: widget.reportModel!.wasteWightController,
                hintText: translations(context).waste_weight,
                maxLines: 1,
              ),
              Text(
                translations(context).other_details,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),

              MyTextFormField(
                controller: widget.reportModel!.detailsController,
                hintText: translations(context).other_details,
                maxLines: 16,
              ),

              Center(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                    minWidth: 270.0.w,
                    color: PRIMARY_GREEN,
                    height: 40,
                    child: Text(
                      translations(context).submit,
                      style: TextStyle(
                          color: WHITE,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                    onPressed: () async {
                      final pdfFile = await PdfApi.generateReportPdf();

                      //Navigate to the next page
                      /* Navigator.pop(context);

                      final report = widget.reportModel!.toJson(wasteType);
                      //push to the database
                      await dbRef.push().set(report);
                      print(report);
                      //Update status value
                      final vlRef = FirebaseDatabase.instance
                          .ref()
                          .child('task')
                          .child(widget.reportModel!.taskId.toString());
                      vlRef.update({"status": true});*/
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Transform _radioButton(
      {required Object? groupValue,
      required dynamic value,
      required void Function(dynamic)? onChanged}) {
    return Transform.scale(
      scale: 1.0.sp,
      child: Radio(
        fillColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return PRIMARY_GREEN;
            }
            return LIGHT_GREY;
          },
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
