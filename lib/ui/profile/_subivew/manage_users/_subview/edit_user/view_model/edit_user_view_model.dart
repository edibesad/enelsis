import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../product/model/user_model.dart';

class EditUserViewModel extends BaseViewModel {
  late UserModel user;

  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController surnameTextEditingController;

  RxnInt depId = RxnInt();

  var canEditUsers = false.obs;

  var canEditTasks = false.obs;

  @override
  void init() {
    if (Get.arguments is UserModel) {
      user = Get.arguments;
      nameTextEditingController = TextEditingController(text: user.name);
      surnameTextEditingController = TextEditingController(text: user.surname);
      userNameTextEditingController =
          TextEditingController(text: user.username);
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  onDeletePressed() {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(onPressed: () {}, child: const Text("Evet")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("İptal"))
          ],
          title: const Text("Uyarı!"),
          content: const Text("Kullanıyı silmek istediğinizden emin misiniz?")),
    );
  }
}
