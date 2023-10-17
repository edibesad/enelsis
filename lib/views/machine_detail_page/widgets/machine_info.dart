import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/view/home/subfeatures/production/machines/model/machine_task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MachineInfo extends StatelessWidget {
  MachineInfo(
      {required this.machineModel, required this.activeTask, super.key});
  final MachineModel machineModel;
  final MachineTaskModel activeTask;
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Makine Bilgileri",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.r)),
        Card(
          child: ListTile(
            leading: const Icon(Icons.title),
            title: const Text("Makine ismi"),
            subtitle: Text(machineModel.name),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.circle,
              color: generateColorByStatus(activeTask.status),
            ),
            title: const Text("Durum"),
            subtitle: Text(activeTask.status == null
                ? "Çalışmıyor"
                : (activeTask.taskTypeModel!.name!)),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.precision_manufacturing),
            title: const Text("Makine Tipi"),
            subtitle: Text(machineModel.type.name!),
          ),
        ),
      ],
    );
  }

  MaterialColor generateColorByStatus(bool? status) {
    switch (status) {
      case null:
        return Colors.red;
      case false:
        return Colors.amber;
      case true:
        return Colors.green;
    }
  }
}
