import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/ui/production/machines/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMachineViewModel extends BaseViewModel {
  late MachineModel machine;
  RxList<DepartmentModel> departments = RxList.empty();
  TextEditingController textEditingController = TextEditingController();

  var isDepartmentsLoading = false.obs;
  RxnInt depId = RxnInt(), typeId = RxnInt(1);

  onDeleteTap() {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(onPressed: () {}, child: const Text("Evet")),
            ElevatedButton(onPressed: () {}, child: const Text("İptal"))
          ],
          title: const Text("Uyarı!"),
          content: const Text("Kullanıyı silmek istediğinizden emin misiniz?")),
    );
  }

  @override
  void init() {
    print(Get.arguments);
    if (Get.arguments is MachineModel) {
      machine = Get.arguments;
      depId.value = machine.department.id!;
      textEditingController.text = machine.name;
      getDepartments();
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
}
