import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/utils/widgets/tasks_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageTasksPage extends StatelessWidget {
  ManageTasksPage({super.key});
  final controller = Get.put(TaskController());
  final bool admin = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Görevleri yönet"),
      ),
      body: FutureBuilder<List<MachineTaskModel>>(
        future: controller.getAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return TasksTable(snapshot.data!, admin);
        },
      ),
    );
  }
}
