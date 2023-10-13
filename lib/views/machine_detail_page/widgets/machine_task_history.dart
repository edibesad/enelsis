import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/utils/widgets/tasks_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MachineTaskHistory extends StatelessWidget {
  MachineTaskHistory(this.machineModel, {super.key});
  final controller = Get.put(TaskController());
  final MachineModel machineModel;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getTasksByMachine(machineModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: const CircularProgressIndicator(),
                ),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Hata!\n${snapshot.error}"),
          );
        }

        return Card(
          child: Column(
            children: [
              Text(
                "Makine Geçmişi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.r),
              ),
              TasksTable(snapshot.data!, false),
            ],
          ),
        );
      },
    );
  }
}
