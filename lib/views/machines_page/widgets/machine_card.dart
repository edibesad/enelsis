import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/views/machine_detail_page/machine_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachineCard extends StatefulWidget {
  const MachineCard(
      {required this.machineModel, required this.activeTask, super.key});
  final MachineModel machineModel;
  final MachineTaskModel activeTask;

  @override
  State<MachineCard> createState() => _MachineCardState();
}

class _MachineCardState extends State<MachineCard> {
  late TaskController taskController;
  @override
  void initState() {
    super.initState();
    taskController = Get.put(TaskController());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MachineDetail(widget.machineModel, widget.activeTask),
          ));
        },
        subtitle:
            (widget.activeTask.status == null || !widget.activeTask.status!)
                ? null
                : Text("Görev İsmi : ${widget.activeTask.name}"),
        title: Text(widget.machineModel.name!),
        leading: Icon(
          Icons.circle,
          color: generateColorByStatus,
        ),
        trailing: (widget.activeTask.status == false)
            ? const Icon(
                Icons.warning,
                color: Colors.red,
              )
            : null,
      ),
    );
  }

  MaterialColor get generateColorByStatus {
    switch (widget.activeTask.status) {
      case null:
        return Colors.red;
      case false:
        return Colors.amber;
      case true:
        return Colors.green;
    }
  }
}
