import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasteless/core/utils/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isShowBottomSheet,
      required this.checkBoxValue,
      this.onChanged});
  final String title;
  final String description;
  final bool isShowBottomSheet;
  final bool checkBoxValue;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            color: LIGHT_BLUE),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),

          //onTab
          onTap: () {
            isShowBottomSheet
                ? showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: REdgeInsets.all(6.0),
                        child: Container(
                          height: 380.h,
                          decoration: BoxDecoration(
                            color: PRIMARY_BLUE,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: REdgeInsets.all(6.0),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: PRIMARY_BLUE,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r))),
                                    height: 8.0.h,
                                    width: 100.w,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: REdgeInsets.all(8.0),
                                child: Text(
                                  description,
                                  style:
                                      TextStyle(fontSize: 18.sp, color: WHITE),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : null;
          },
          //CheckBox
          leading: Transform.scale(
            scale: 2.0.sp,
            child: Checkbox(
              side: BorderSide(width: 0.9.w, color: PRIMARY_BLUE),
              shape: const CircleBorder(),
              value: checkBoxValue,
              onChanged: onChanged,
              activeColor: PRIMARY_BLUE,
            ),
          ),
        ),
      ),
    );
  }
}
