import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/views/machine_detail_page/widgets/machine_task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MachineTaskInfo extends StatelessWidget {
  const MachineTaskInfo(
      {required this.machineModel, required this.activeTask, super.key});
  final MachineModel machineModel;
  final MachineTaskModel activeTask;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Makine Son İşlem",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
        ),
        Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.task),
                title: const Text("Görev ismi"),
                subtitle: Text(activeTask.name!),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task),
                title: const Text("Açıklama"),
                subtitle: Text(activeTask.description ?? "-"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.engineering),
                title: const Text("Operatör"),
                subtitle: Text(
                    "${activeTask.createdBy!.name} ${activeTask.createdBy!.surname}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.date_range),
                title: const Text("Başlama tarihi"),
                subtitle: Text(
                    "${activeTask.createdAt!.day}/${activeTask.createdAt!.month}/${activeTask.createdAt!.year} ${activeTask.createdAt!.hour}:${activeTask.createdAt!.minute}"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
