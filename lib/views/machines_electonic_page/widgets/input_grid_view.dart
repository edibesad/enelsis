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
            if (pageController.chosenBoard.value == null ||
                pageController.chosenProduct.value == null) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Hata!"),
                  content: const Text("Ürün ve giriş seçmeden devam edilemez"),
                  actions: [
                    ElevatedButton(
                        onPressed: () => Get.back(), child: const Text("Tamam"))
                  ],
                ),
              );
              return;
            }

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
