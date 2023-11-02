import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../models/department_model.dart';
import '../../../../../../../product/model/user_model.dart';

class EditUserViewModel extends BaseViewModel {
  late UserModel user;

  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController surnameTextEditingController;

  RxnInt depId = RxnInt();

  var isDepartmentsLoading = false.obs;

  RxList<DepartmentModel> departments = RxList.empty();

  var canEditUsers = false.obs;

  var canEditTasks = false.obs;

  @override
  void init() {
    if (Get.arguments is UserModel) {
      user = Get.arguments;
      getDepartments();
      nameTextEditingController = TextEditingController(text: user.name);
      surnameTextEditingController = TextEditingController(text: user.surname);
      userNameTextEditingController =
          TextEditingController(text: user.username);
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  getDepartments() async {
    isDepartmentsLoading.value = true;
    var data = jsonDecode(await SimService().fetchDepartments()) as List;
    departments.value = data.map((e) => DepartmentModel.fromJson(e)).toList();
    isDepartmentsLoading.value = false;
  }

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
