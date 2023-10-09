import 'package:enelsis/controller/machine_electronic_controller.dart';
import 'package:enelsis/models/input_model.dart';
import 'package:enelsis/models/item_input_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputGridView extends StatelessWidget {
  InputGridView({super.key});
  final pageController = Get.put(MachineElectronicPageController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemCount: pageController.machine.value!.info!.inputPerBoard,
      itemBuilder: (context, index) => Card(
        child: GestureDetector(
          onTap: () {
            Get.toNamed("/item_control",
                arguments: ProductInputModel(
                    input: InputModel(
                        board: pageController.chosenBoard.value!,
                        order: index + 1),
                    product: pageController.chosenProduct.value!));
          },
          child: Container(
            color: context.theme.primaryColor.withAlpha(100),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
