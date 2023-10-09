import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/views/machine_detail_page/widgets/machine_info.dart';
import 'package:enelsis/views/machine_detail_page/widgets/machine_task_dialog.dart';
import 'package:enelsis/views/machine_detail_page/widgets/machine_task_history.dart';
import 'package:enelsis/views/machine_detail_page/widgets/machine_task_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MachineDetail extends StatelessWidget {
  MachineDetail(this.machineModel, this.activeTask, {super.key});
  final MachineModel machineModel;
  final TaskController controller = Get.put(TaskController());
  final MachineTaskModel activeTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(machineModel.name),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const MachineTaskDialog(),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MachineInfo(
                machineModel: machineModel,
                activeTask: activeTask,
              ),
              SizedBox(
                height: 20.h,
              ),
              MachineTaskInfo(
                machineModel: machineModel,
                activeTask: activeTask,
              ),
              SizedBox(
                height: 20.h,
              ),
              MachineTaskHistory(machineModel)
            ],
          ),
        ),
      ),
    );
  }
}
