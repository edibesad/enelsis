import 'dart:developer';
import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class EditTaskViewModel extends BaseViewModel {
  RxList<UserModel> users = RxList.empty();
  RxList<MachineModel> machines = RxList.empty();

  var isUsersLoading = false.obs;
  var isMachinesLoading = false.obs;

  RxnInt machineId = RxnInt(), userId = RxnInt();

  MachineTaskModel? task;

  TextEditingController taksNameTextEditingController = TextEditingController();

  var switchValue = RxnBool();

  final textFieldKey = GlobalKey<FormState>();

  @override
  void init() {
    task = Get.arguments;
    machineId.value = task!.machine!.id;
    userId.value = task!.createdBy!.id;
    taksNameTextEditingController.text = task!.description!;
    switchValue.value = task!.status;
    getMachines();
    getUsers();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  getMachines() async {
    isMachinesLoading.value = true;
    final response =
        await networkManagerInstance.dioGet("/machines", MachineModel());
    machines.value = response.dataList!;
    isMachinesLoading.value = false;
  }

  getUsers() async {
    isUsersLoading.value = true;
    users.value = [
      UserModel(
          name: "admin",
          surname: "admin",
          id: 1,
          password: "admin",
          username: "admin",
          isAdmin: false),
      UserModel(
          name: "111",
          surname: "111",
          id: 3,
          password: "111",
          username: "111",
          isAdmin: false)
    ];

    isUsersLoading.value = false;
  }

  Future<void> saveButtonOnPressed() async {
    if (!textFieldKey.currentState!.validate()) {
      return;
    }
    BaseResponseModel responseModel = await networkManagerInstance.dioPost(
        "/machine_tasks/update/${task!.id}", task!.toJson());
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(viewModelContext)
        .showSnackBar(SnackBar(content: Text(responseModel.message!)));
    if (responseModel.result!) {
      Get.back();
    }
  }

  void onMachineChanged(int? value) {
    machineId.value = value;
    task!.machine = machines.firstWhere((element) => element.id == value);
  }

  void onDescChanged(String value) {
    task!.description = value;
  }

  onDateTimeButtonPressed() async {
    task!.createdAt = await showOmniDateTimePicker(
      context: viewModelContext,
      is24HourMode: true,
      isForce2Digits: true,
    );
  }

  void switchOnChanged(bool value) {
    switchValue.value = value;
    task!.status = value;
  }

  void userOnChanged(int? value) {
    userId.value = value!;
    task!.createdBy = users.firstWhere((element) => element.id == value);
    log(task!.createdBy!.id!.toString());
  }

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen göre açıllaması giriniz';
    }
    return null;
  }
}
