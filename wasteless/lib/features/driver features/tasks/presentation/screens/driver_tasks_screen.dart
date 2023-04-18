import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/features/driver%20features/tasks/presentation/screens/report_screen.dart';

import '../../../../../core/utils/assets_path.dart';

class DriverTasksScreen extends StatefulWidget {
  static const String id = 'driver_tasks_screen';
  const DriverTasksScreen({
    super.key,
  });

  @override
  State<DriverTasksScreen> createState() => _DriverTasksScreenState();
}

class _DriverTasksScreenState extends State<DriverTasksScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('task');
  int count = 0;
  getTasksAmount() async {
    final response = await FirebaseDatabase.instance.ref().child('task').once();
    count = response.snapshot.children.length;

    return count;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // My Task
              FutureBuilder(
                future: getTasksAmount(),
                builder: (context, snapshot) => ListTile(
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: CircleAvatar(
                        radius: 30.0,
                        child: Image.asset(ANWAR_IMAGE),
                      ),
                    ),
                    title: const Text(
                      'My Tasks',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    subtitle: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '$count ',
                        style: const TextStyle(fontSize: 24, color: BLACK),
                      ),
                      const TextSpan(
                        text: 'tasks for ',
                        style: TextStyle(fontSize: 24, color: BLACK),
                      ),
                      const TextSpan(
                          text: 'today',
                          style: TextStyle(
                              fontSize: 24,
                              color: BLACK,
                              decoration: TextDecoration.underline)),
                    ]))),
              ),

              const SizedBox(
                height: 18,
              ),
              const Text(
                "Todo",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_GREEN),
              ),
              // Tasks List
              SizedBox(
                height: 170,
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: ((context, snapshot, animation, index) {
                    return snapshot.child('status').value == false
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: LIGHT_BLUE),
                              child: ListTile(
                                //OnTab
                                onTap: () {
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 380,
                                          decoration: const BoxDecoration(
                                            color: PRIMARY_BLUE,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Center(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    height: 8.0,
                                                    width: 100,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  snapshot
                                                      .child('description')
                                                      .value
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                //CheckBox
                                leading: Transform.scale(
                                  scale: 1.8,
                                  child: Checkbox(
                                    side: const BorderSide(
                                        width: 0.9, color: PRIMARY_BLUE),
                                    shape: const CircleBorder(),
                                    value:
                                        snapshot.child('status').value as bool,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        final vlRef = FirebaseDatabase.instance
                                            .ref()
                                            .child('task')
                                            .child(snapshot.key.toString());
                                        vlRef.update({"status": true});

                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => ReportScreen(
                                              taskId: snapshot.key,
                                              taskName: snapshot
                                                  .child('title')
                                                  .value
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    activeColor: PRIMARY_BLUE,
                                  ),
                                ),
                                title: Text(
                                  snapshot.child('title').value.toString(),
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox();
                  }),
                ),
              ),
              const Text(
                "Done",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_GREEN),
              ),
              SizedBox(
                height: 170,
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: ((context, snapshot, animation, index) {
                    return snapshot.child('status').value == true
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: LIGHT_BLUE),
                              child: ListTile(
                                //OnTab
                                onTap: () {
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 380,
                                          decoration: const BoxDecoration(
                                            color: PRIMARY_BLUE,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Center(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    height: 8.0,
                                                    width: 100,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  snapshot
                                                      .child('description')
                                                      .value
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                //CheckBox
                                leading: Transform.scale(
                                  scale: 1.8,
                                  child: Checkbox(
                                    side: const BorderSide(
                                        width: 0.9, color: PRIMARY_BLUE),
                                    shape: const CircleBorder(),
                                    value:
                                        snapshot.child('status').value as bool,
                                    onChanged: (bool? newValue) {},
                                    activeColor: PRIMARY_BLUE,
                                  ),
                                ),
                                title: Text(
                                  snapshot.child('title').value.toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
