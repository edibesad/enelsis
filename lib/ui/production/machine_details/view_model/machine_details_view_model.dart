import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
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

    BaseResponseModel<MachineTaskModel> respone = await networkManagerInstance
        .dioGet<MachineTaskModel>("/machine_tasks", MachineTaskModel(),
            queryParameters: {"machine_id": machine.value!.id});

    tasks.value = respone.dataList!;

    isLoading.value = false;
  }
}
