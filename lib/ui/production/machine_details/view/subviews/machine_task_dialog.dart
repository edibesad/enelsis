import 'package:enelsis/ui/production/machine_details/view_model/machine_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachineTaskDialog extends StatefulWidget {
  const MachineTaskDialog({super.key, required this.viewModel});
  final MachineDetailsViewModel viewModel;
  @override
  State<MachineTaskDialog> createState() => _MachineTaskDialogState();
}

class _MachineTaskDialogState extends State<MachineTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Görev ekle"),
      content: Form(
          key: widget.viewModel.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [buildTaskDescInput(), buildSwitchListTile()],
          )),
      actions: [
        ElevatedButton(
          onPressed: widget.viewModel.addTask,
          child: const Text("Tamam"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("İptal"),
        )
      ],
    );
  }

  buildSwitchListTile() {
    return Obx(() => SwitchListTile(
          inactiveThumbColor: Colors.red,
          inactiveTrackColor: Colors.red.shade100,
          secondary: Text(widget.viewModel.status.value
              ? "Makine çalışıyor"
              : "Makine çalışmıyor"),
          activeColor: Colors.green,
          value: widget.viewModel.status.value,
          onChanged: (value) {
            setState(() {
              widget.viewModel.status.value = value;
            });
          },
        ));
  }

  TextFormField buildTaskDescInput() {
    return TextFormField(
      validator: widget.viewModel.validate,
      controller: widget.viewModel.descController,
      decoration: const InputDecoration(labelText: "Görev açıklaması"),
    );
  }
}
