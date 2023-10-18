import 'dart:convert';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:enelsis/ui/production/machines/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/subviews/machine_task_dialog.dart';

class MachineDetailsViewModel extends BaseViewModel {
  Rxn<MachineModel> machine = Rxn<MachineModel>();
  RxList<MachineTaskModel> tasks = RxList<MachineTaskModel>.empty();
  var isLoading = false.obs;

  @override
  void init() {
    if (Get.arguments is MachineModel) {
      machine.value = Get.arguments;
      getmachinesTasks();
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void showAddTaskDialog() => showDialog(
        context: viewModelContext,
        builder: (context) => const MachineTaskDialog(),
      );
  getmachinesTasks() async {
    isLoading.value = true;
    final json =
        jsonDecode(await SimService().fetchTasksByMachineId(machine.value!.id))
            as List;
    tasks.value = json.map((e) => MachineTaskModel.fromJson(e)).toList();
    isLoading.value = false;
  }
}
