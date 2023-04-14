import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../widgets/new_task_button.dart';
import '../widgets/task_widget.dart';

class AdminTasksScreen extends StatelessWidget {
  static const String id = 'admin_tasks_screen';
  const AdminTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBlueBackground(
        widget: SingleChildScrollView(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NewTaskButton(
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                WASTELESS_LOGO,
                height: context.height * 0.15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
        TaskWidget(
          taskName: "Task Name 0",
          taskDate: '02 FEB',
          image: WASTELESS_LOGO,
          deleteAction: () {},
          driverName: 'Fahad Faisl',
          changeDriverAction: () {},
        ),
        TaskWidget(
          taskName: "Task Name 0",
          taskDate: '02 FEB',
          image: WASTELESS_LOGO,
          deleteAction: () {},
          driverName: 'Fahad Faisl',
          changeDriverAction: () {},
        ),
        TaskWidget(
          taskName: "Task Name 0",
          taskDate: '02 FEB',
          image: WASTELESS_LOGO,
          deleteAction: () {},
          driverName: 'Fahad Faisl',
          changeDriverAction: () {},
        ),
        TaskWidget(
          taskName: "Task Name 0",
          taskDate: '02 FEB',
          image: WASTELESS_LOGO,
          deleteAction: () {},
          driverName: 'Fahad Faisl',
          changeDriverAction: () {},
        ),
        TaskWidget(
          taskName: "Task Name 0",
          taskDate: '02 FEB',
          image: WASTELESS_LOGO,
          deleteAction: () {},
          driverName: 'Fahad Faisl',
          changeDriverAction: () {},
        ),
        TaskWidget(
          taskName: "Task Name 0",
          taskDate: '02 FEB',
          image: WASTELESS_LOGO,
          deleteAction: () {},
          driverName: 'Fahad Faisl',
          changeDriverAction: () {},
        )
      ]),
    ));
  }
}
