import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/view_model/manage_items_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController unitTextEditingController = TextEditingController();

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  String? validator(String? value) {
    if (value!.isEmpty || value == "") {
      return "Bu alan boş olamaz";
    }
    return null;
  }

  Future<void> onSavePressed() async {
    if (formKey.currentState!.validate()) {
      BaseResponseModel response = await networkManagerInstance.dioPost(
          "/items/add", {
        "name": nameTextEditingController.text,
        "unit": unitTextEditingController.text
      });
      if (response.result == true) {
        Get.back();
        Get.put(ManageItemsViewModel()).getItems();
      }
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
  }
}
