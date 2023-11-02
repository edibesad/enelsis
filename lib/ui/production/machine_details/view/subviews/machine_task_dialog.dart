import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MachineTaskDialog extends StatefulWidget {
  const MachineTaskDialog({super.key});

  @override
  State<MachineTaskDialog> createState() => _MachineTaskDialogState();
}

class _MachineTaskDialogState extends State<MachineTaskDialog> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Görev ekle"),
      content: Form(
          child: SizedBox(
        height: 180.h,
        child: Column(
          children: [
            buildTaskNameInput(),
            buildTaskDescInput(),
            buildSwitchListTile()
          ],
        ),
      )),
      actions: [
        ElevatedButton(
          onPressed: () {},
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

  SwitchListTile buildSwitchListTile() {
    return SwitchListTile(
      inactiveThumbColor: Colors.red,
      inactiveTrackColor: Colors.red.shade100,
      secondary:
          Text(status == true ? "Makine çalışıyor" : "Makine çalışmıyor"),
      activeColor: Colors.green,
      value: status,
      onChanged: (value) {
        setState(() {
          status = value;
        });
      },
    );
  }

  TextFormField buildTaskDescInput() {
    return TextFormField(
      controller: descController,
      decoration: const InputDecoration(labelText: "Görev açıklaması"),
    );
  }

  TextFormField buildTaskNameInput() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(labelText: "Görev ismi"),
    );
  }
}
