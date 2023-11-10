import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/model/input_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../product/model/machine_model.dart';

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
    BaseResponseModel<ProductModel> response = await networkManagerInstance
        .dioGet<ProductModel>("/products", ProductModel());
    products.value = response.dataList!;
    isProductsLoading.value = false;
  }

  void navigateToControl(InputModel input) {
    navigation.navigateToPage(
        path: NavigationConstants.ITEM_CONTROL, data: input);
  }

  onGestureTap(int index) async {
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
    InputModel input = InputModel(
        board: chosenBoard.value,
        inputOrder: index,
        product: products
            .firstWhere((element) => element.id == chosenProduct.value!.id));

    BaseResponseModel<InputModel> response = await networkManagerInstance
        .dioGet("/inputs", InputModel(), queryParameters: input.toJson());

    if (response.totalLen == 0) {
      showAddInputDialog(index, input);
    } else if (response.totalLen != 1) {
      showWarnDialog();
    } else {
      navigation.navigateToPage(
          path: NavigationConstants.ITEM_CONTROL,
          data: response.dataList!.first);
    }
  }

  void showAddInputDialog(index, InputModel input) {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
        title: const Text("Bu giriş için herhangi bir bilgi bulunmamaktadır.!"),
        content:
            const Text("Bu giriş için herhangi bir bilgi bulunmamaktadır."),
        actions: [
          ElevatedButton(
              onPressed: () => navigation.navigateToPage(
                  path: NavigationConstants.ADD_INPUT, data: input),
              child: const Text("Ekle")),
          ElevatedButton(
              onPressed: () => Get.back(), child: const Text("İptal"))
        ],
      ),
    );
  }

  void showWarnDialog() {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
        title: const Text("Uyarı"),
        content:
            const Text("Bu giriş için birden fazla bilgi bulunmamaktadır."),
        actions: [
          ElevatedButton(
              onPressed: () => Get.back(), child: const Text("Tamam"))
        ],
      ),
    );
  }
}
