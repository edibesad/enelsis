import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/view_model/manage_items_view_model.dart';
import 'package:enelsis/ui/stock/stock_history/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemViewModel extends BaseViewModel {
  late ItemModel item;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController unitTextEditingController = TextEditingController();

  @override
  void init() {
    item = Get.arguments;
    nameTextEditingController.text = item.name!;
    unitTextEditingController.text = item.unit!;
  }

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
    BaseResponseModel response = await networkManagerInstance.dioPost(
        "/items/update/${item.id}", {
      "name": nameTextEditingController.text,
      "unit": unitTextEditingController.text
    });
    if (response.result!) {
      Get.back();
      Get.put(ManageItemsViewModel()).getItems();
    }
    ScaffoldMessenger.of(viewModelContext)
        .showSnackBar(SnackBar(content: Text(response.message!)));
  }

  onDeletePressed() async {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(
                onPressed: () async {
                  BaseResponseModel response =
                      await networkManagerInstance.dioDelete(
                    "/items/delete/${item.id}",
                  );
                  if (response.result!) {
                    Get.back();
                    Get.back();
                    Get.put(ManageItemsViewModel()).getItems();
                  }
                  ScaffoldMessenger.of(viewModelContext)
                      .showSnackBar(SnackBar(content: Text(response.message!)));
                },
                child: const Text("Evet")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("İptal"))
          ],
          title: const Text("Uyarı!"),
          content: const Text("Makineyi silmek istediğinizden emin misiniz?")),
    );
  }
}
