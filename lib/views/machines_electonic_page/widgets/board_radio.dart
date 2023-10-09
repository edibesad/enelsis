import 'package:enelsis/controller/machine_electronic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardRadio extends StatefulWidget {
  const BoardRadio({super.key});

  @override
  State<BoardRadio> createState() => _BoardRadioState();
}

class _BoardRadioState extends State<BoardRadio> {
  final pageController = Get.put(MachineElectronicPageController());

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0;
          i < pageController.machine.value!.info!.numberOfBoard;
          i++)
        Expanded(
          child: RadioListTile<int?>(
            title: Text("Tabla ${i + 1}"),
            value: i + 1,
            groupValue: pageController.chosenBoard.value,
            onChanged: (value) {
              setState(() {
                pageController.chosenBoard.value = value;
              });
            },
          ),
        ),
    ]);
  }
}
