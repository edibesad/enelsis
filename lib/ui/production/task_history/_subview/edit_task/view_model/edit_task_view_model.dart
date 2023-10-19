import 'dart:convert';

import 'package:enelsis/_trashcan/machine_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTaskViewModel extends BaseViewModel {
  RxList<UserModel> users = RxList.empty();
  RxList<MachineModel> machines = RxList.empty();

  var isUsersLoading = false.obs;
  var isMachinesLoading = false.obs;

  RxnInt machineId = RxnInt(), userId = RxnInt();

  MachineTaskModel? task;

  TextEditingController taksNameTextEditingController = TextEditingController();

  @override
  void init() {
    task = Get.arguments;
    machineId.value = task!.machine!.id;
    userId.value = task!.createdBy!.id;
    taksNameTextEditingController.text = task!.name!;
    getMachines();
    getUsers();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  getMachines() async {
    isMachinesLoading.value = true;
    final json = jsonDecode(await SimService().fetchMachines()) as List;
    machines.value = json.map((e) => MachineModel.fromJson(e)).toList();
    isMachinesLoading.value = false;
  }

  getUsers() async {
    isUsersLoading.value = true;
    final json = jsonDecode(await SimService().fetchUsers()) as List;
    users.value = json.map((e) => UserModel.fromJson(e)).toList();
    isUsersLoading.value = false;
  }
}
