import 'package:enelsis/controller/machine_electronic_controller.dart';
import 'package:enelsis/controller/product_controller.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownFutureBuilder extends StatelessWidget {
  DropDownFutureBuilder({super.key});
  final productController = Get.put(ProductController());
  final pageController = Get.put(MachineElectronicPageController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: productController.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return Obx(() => DropdownButton<ProductModel>(
                value: pageController.chosenProduct.value,
                items: snapshot.data!
                    .map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.name!)))
                    .toList(),
                onChanged: (value) {
                  pageController.chosenProduct.value = value;
                },
              ));
        }
        return const Text("Hata");
      },
    );
  }
}
