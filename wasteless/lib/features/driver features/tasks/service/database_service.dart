import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/bloc/task_bloc.dart';

class DatabaseService {
  static int taskCount = 0;

  //* get Tasks count
  static getTasksAmount() async {
    final response = await FirebaseDatabase.instance.ref().child('task').once();
    taskCount = response.snapshot.children.length;
  }

  //* on any value in the database
  static onValue({required BuildContext context}) {
    FirebaseDatabase.instance.ref().child('task').onValue.listen(
      (event) {
        print('OnValue');
        isDone(context: context);
      },
    );
  }

  //* check if task done
  static isDone({required BuildContext context}) async {
    final response =
        FirebaseDatabase.instance.ref().child('task').orderByChild('status');

    response.equalTo(false).once().then((snapshot) {
      if (snapshot.snapshot.value != null) {
        print("Not Done Task");
        context.read<TaskBloc>().add(NotDoneTaskEvent());
      } else if (snapshot.snapshot.value == null) {
        print("All tasks Done ");
        BlocProvider.of<TaskBloc>(context).add(DoneTaskEvent());
      }
    }).whenComplete(() {
      response.equalTo(true).once().then((snapshot) {
        if (snapshot.snapshot.value != null) {
          print("there is Task");
          BlocProvider.of<TaskBloc>(context).add(IsThereTaskEvent());
        }
      });
    });
  }
}
