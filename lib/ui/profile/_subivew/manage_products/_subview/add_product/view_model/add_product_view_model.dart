import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/view_model/manage_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final textEditingController = TextEditingController();

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  String? validator(String? value) {
    if (value! == "" || value.isEmpty) {
      return "Bu alan boş olamaz";
    }
    return null;
  }

  Future<void> onSavePressed() async {
    if (formKey.currentState!.validate()) {
      BaseResponseModel response = await networkManagerInstance
          .dioPost("/products/add", {"name": textEditingController.text});
      if (response.result!) {
        Get.put(ManageProductsViewModel()).getProducts();
        Get.back();
      }
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
  }
}
