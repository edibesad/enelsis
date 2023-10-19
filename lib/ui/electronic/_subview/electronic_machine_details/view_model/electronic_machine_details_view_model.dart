import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/model/input_model.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/model/item_input_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../production/machines/model/machine_model.dart';

class ElectronciMachineDetailsViewModel extends BaseViewModel {
  MachineModel? machine;
  Rxn<ProductModel> chosenProduct = Rxn();

  RxList<ProductModel> products = RxList.empty();

  RxnInt chosenBoard = RxnInt();
  RxBool isProductsLoading = false.obs;

  @override
  void init() {
    machine = Get.arguments;
    getProducts();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  getProducts() async {
    isProductsLoading.value = true;
    final json = jsonDecode(await SimService().fetchProducts()) as List;
    products.value = json.map((e) => ProductModel.fromJson(e)).toList();
    isProductsLoading.value = false;
  }

  void navigateToControl(ProductInputModel productInput) {
    navigation.navigateToPage(
        path: NavigationConstants.ITEM_CONTROL, data: productInput);
  }

  onGestureTap(int index) {
    if (chosenBoard.value == null || chosenProduct.value == null) {
      showDialog(
        context: viewModelContext,
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
    navigateToControl(ProductInputModel(
        input: InputModel(board: chosenBoard.value!, order: index + 1),
        product: chosenProduct.value!));
  }
}
