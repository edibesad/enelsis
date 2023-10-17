import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/view/subfeatures/production/machines/model/machine_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/tasks_table.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());

    return FutureBuilder<List<MachineTaskModel>>(
      future: controller.getAllTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return TasksTable(snapshot.data!, false);
      },
    );
  }
}
