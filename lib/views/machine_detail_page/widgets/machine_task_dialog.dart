import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachineTaskDialog extends StatelessWidget {
  MachineTaskDialog({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Görev ekle"),
      content: Form(
          child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Görev ismi"),
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
}
