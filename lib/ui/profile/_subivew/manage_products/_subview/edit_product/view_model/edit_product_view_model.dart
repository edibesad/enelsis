import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProdcutViewModel extends BaseViewModel {
  TextEditingController textEditingController = TextEditingController();
  late ProductModel product;
  @override
  void init() {
    if (Get.arguments is ProductModel) {
      product = Get.arguments;
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
}
