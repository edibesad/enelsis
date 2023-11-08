import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/product/view_model/user_view_model.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:enelsis/ui/production/machines/view_model/production_machines_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/subviews/machine_task_dialog.dart';

class MachineDetailsViewModel extends BaseViewModel {
  Rxn<MachineModel> machine = Rxn<MachineModel>();
  RxList<MachineTaskModel> tasks = RxList<MachineTaskModel>.empty();
  var isLoading = false.obs;

  var status = false.obs;
  final TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserViewModel userViewModel = Get.put(UserViewModel());

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
        builder: (context) => MachineTaskDialog(
          viewModel: this,
        ),
      );

  getmachinesTasks() async {
    isLoading.value = true;

    BaseResponseModel<MachineTaskModel> respone = await networkManagerInstance
        .dioGet<MachineTaskModel>("/machine_tasks", MachineTaskModel(),
            queryParameters: {"machine_id": machine.value!.id});

    tasks.value = respone.dataList!;

    isLoading.value = false;
  }

  Future<void> addTask() async {
    if (formKey.currentState!.validate()) {
      var respone = await networkManagerInstance.dioPost("/machine_tasks/add", {
        "description": descController.text,
        "status": status,
        "created_by": userViewModel.user.value!.id,
        "task_type": status.value ? 1 : 2,
        "machine_id": machine.value!.id
      });
      Get.back();
      updateMachineInfo();
      getmachinesTasks();
      getLastTask();
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(respone.message!)));
      Get.put(ProductionMachinesViewModel()).getMachinesRequest();
    }
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan doldurulmalıdır';
    }
    return null;
  }

  Future<void> getLastTask() async {
    final response = await networkManagerInstance.dioGet(
        "machine_tasks/last", MachineTaskModel(),
        queryParameters: {"machine_id": machine.value!.id});
    if (response.totalLen == 1) {
      machine.value!.task = response.dataList![0];
      machine.refresh();
    }
  }

  Future<void> updateMachineInfo() async {
    BaseResponseModel<MachineModel> response = await networkManagerInstance
        .dioGet("/machines/${machine.value!.id}", MachineModel());
    machine.value = response.dataList![0];
  }
}
