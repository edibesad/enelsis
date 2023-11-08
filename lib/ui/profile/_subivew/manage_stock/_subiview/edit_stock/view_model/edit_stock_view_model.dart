import 'dart:developer';
import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/manage_stock_view_model.dart';

class EditStockViewModel extends BaseViewModel {
  late ItemStockModel stock;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController unitTextEditingController = TextEditingController();
  TextEditingController quantityTextEditingController = TextEditingController();

  @override
  void init() {
    stock = Get.arguments;
    nameTextEditingController.text = stock.item!.name!;
    unitTextEditingController.text = stock.item!.unit!;
    if (stock.quantity != null) {
      quantityTextEditingController.text = stock.quantity!.toString();
    }
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  String? validator(String? value) {
    if (value!.isEmpty || value == "") {
      return "Bu boş olamazs";
    }
    return null;
  }

  Future<void> onSavePressed() async {
    if (formKey.currentState!.validate()) {
      log(stock.item!.id.toString());
      late BaseResponseModel response;
      if (stock.id != null) {
        response = await networkManagerInstance
            .dioPost<ItemStockModel>("/stock/update/${stock.id}", {
          "quantity": int.parse(quantityTextEditingController.text),
          "item_id": stock.item!.id
        });
      } else {
        response =
            await networkManagerInstance.dioPost<ItemStockModel>("/stock/add", {
          "quantity": int.parse(quantityTextEditingController.text),
          "item_id": stock.item!.id
        });
      }

      if (response.result!) {
        Get.back();
        Get.put(ManageStockViewModel()).getStocks();
      }
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
  }
}
