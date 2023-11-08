import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/view_model/manage_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProdcutViewModel extends BaseViewModel {
  TextEditingController textEditingController = TextEditingController();
  late ProductModel product;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void init() {
    if (Get.arguments is ProductModel) {
      product = Get.arguments;
      textEditingController.text = product.name!;
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  onDeletePressed() async {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
        content: const Text("Silmek istediğinize emin misiniz?"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                BaseResponseModel response = await networkManagerInstance
                    .dioDelete("/products/delete/${product.id}");
                if (response.result!) {
                  Get.put(ManageProductsViewModel()).getProducts();

                  Get.back();
                }
                Get.back();
                ScaffoldMessenger.of(viewModelContext)
                    .showSnackBar(SnackBar(content: Text(response.message!)));
              },
              child: const Text("Evet")),
          ElevatedButton(
              onPressed: () async {
                Get.back();
              },
              child: const Text("Hayır"))
        ],
      ),
    );
  }

  onSavePressed() async {
    if (formKey.currentState!.validate()) {
      BaseResponseModel response = await networkManagerInstance.dioPost(
          "/products/update/${product.id}",
          {"name": textEditingController.text});
      if (response.result!) {
        Get.put(ManageProductsViewModel()).getProducts();
        ScaffoldMessenger.of(viewModelContext)
            .showSnackBar(SnackBar(content: Text(response.message!)));
        Get.back();
        Get.back();
      }
    }
  }

  String? validator(String? value) {
    if (value!.isEmpty || value == "") {
      return "Bu alan boş olamaz";
    }
    return null;
  }
}
