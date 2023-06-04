import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/database_service.dart';
import '../bloc/task_bloc.dart';
import '../widgets/done_task/done_task_widget.dart';
import '../widgets/profile.dart';
import '../widgets/todo_task/todo_task_widget.dart';

class DriverTaskScreen extends StatefulWidget {
  static const String id = 'DriverTaskScreen';
  const DriverTaskScreen({super.key});

  @override
  State<DriverTaskScreen> createState() => _DriverTaskScreenState();
}

class _DriverTaskScreenState extends State<DriverTaskScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('task');

  @override
  void initState() {
    DatabaseService.onValue(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(15.0),
          child: Column(
            children: [
              //Profile
              profile(),

              //Task state
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is TaskInitial) {
                    return const SizedBox();
                  } else if (state is StatusValueTrueState) {
                    return DoneTaskWidget(
                      query: dbRef,
                    );
                  } else if (state is StatusValueFalseState) {
                    return ToDoTaskWidget(
                      query: dbRef,
                    );
                  } else if (state is IsThereTaskState) {
                    return ToDoTaskWidget(
                      query: dbRef,
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
