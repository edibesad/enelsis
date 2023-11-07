import 'dart:developer';
import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/model/input_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../stock/stock_history/model/item_model.dart';

class AddInputViewModel extends BaseViewModel {
  InputModel? input;
  RxList<ItemModel> items = RxList.empty();
  RxList<ProductModel> products = RxList.empty();

  RxBool isItemsLoading = false.obs;
  RxBool isProductsLoading = false.obs;

  RxnInt productId = RxnInt();
  RxnInt itemId = RxnInt();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController boardTextEditingController = TextEditingController();
  TextEditingController inputTextEditingController = TextEditingController();

  @override
  void init() {
    getProducts();
    getItems();
    input = Get.arguments ?? InputModel();
    boardTextEditingController.text = input!.board.toString();
    inputTextEditingController.text = input!.inputOrder.toString();

    if (input!.product != null) {
      productId.value = input!.product!.id;
    }
    if (input!.item != null) {
      itemId.value = input!.item!.id;
    }
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  getProducts() async {
    isProductsLoading.value = true;
    BaseResponseModel<ProductModel> response = await networkManagerInstance
        .dioGet<ProductModel>("/products", ProductModel());
    if (response.result!) {
      products.value = response.dataList!;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
    isProductsLoading.value = false;
  }

  getItems() async {
    isItemsLoading.value = true;
    BaseResponseModel<ItemModel> response =
        await networkManagerInstance.dioGet<ItemModel>("/items", ItemModel());
    if (response.result!) {
      items.value = response.dataList!;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
    isItemsLoading.value = false;
  }

  void productDropdownOnChanged(int? value) {
    productId.value = value;
    input!.product = products.firstWhere((element) => element.id == value);
    log(input!.toJson().toString());
  }

  void itemDropdownOnChanged(int? value) {
    itemId.value = value;
    input!.item = items.firstWhere((element) => element.id == value);
    log(input!.toJson().toString());
  }

  saveOnPressed() async {
    if (key.currentState!.validate()) {
      BaseResponseModel response =
          await networkManagerInstance.dioPost("/inputs/add", input!.toJson());
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(viewModelContext).showSnackBar(SnackBar(
        content: Text(response.message!),
      ));
    }
  }

  void onBoardTextFieldChanged(String value) {
    input!.board = int.tryParse(value);
  }

  void onInputTextFieldChanged(String value) {
    input!.inputOrder = int.tryParse(value);
  }
}
