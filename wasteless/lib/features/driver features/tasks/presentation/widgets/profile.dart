import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasteless/core/utils/colors.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../service/database_service.dart';

profile() {
  return FutureBuilder(
    future: DatabaseService.getTasksAmount(),
    builder: (context, snapshot) => ListTile(
      trailing: Transform.scale(
        scale: 1.5,
        child: CircleAvatar(
          radius: 30.0.r,
          backgroundColor: WHITE,
          child: Image.asset(
            ANWAR_IMAGE,
          ),
        ),
      ),
      title: Text(
        'My Tasks',
        style: TextStyle(
            fontFamily: "Cairo", fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${DatabaseService.taskCount} ',
              style: TextStyle(fontSize: 18.sp),
            ),
            TextSpan(
              text: 'tasks for ',
              style: TextStyle(fontSize: 18.sp),
            ),
            TextSpan(
                text: 'tody',
                style: TextStyle(
                    fontSize: 18.sp, decoration: TextDecoration.underline)),
          ],
        ),
      ),
    ),
  );
}
