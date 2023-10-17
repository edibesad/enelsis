import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/product/view_model/user_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/view/production/_model/machine_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskHistroyViewModel extends BaseViewModel {
  @override
  void init() {
    userViewModel = Get.put(UserViewModel());
    getTasks();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  RxList<MachineTaskModel> tasks = RxList<MachineTaskModel>();
  var isLoading = false.obs, isAscending = false.obs;
  RxnInt sortColumnIndex = RxnInt();
  late Offset tapXY;
  late RenderBox? overlay;
  late UserViewModel userViewModel;

  getTasks() async {
    isLoading.value = true;
    tasks.value = (jsonDecode(await SimService().fetchTasks()) as List)
        .map((e) => MachineTaskModel.fromJson(e))
        .toList();
    isLoading.value = false;
  }

  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }

  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY & const Size(40, 40), overlay!.size);

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      tasks.sort(
          (task1, task2) => compareString(ascending, task1.name!, task2.name!));
    }
    if (columnIndex == 1) {
      tasks.sort((task1, task2) => compareString(
          ascending, task1.createdBy!.name!, task2.createdBy!.name!));
    }

    if (columnIndex == 2) {
      tasks.sort((task1, task2) =>
          compareDates(ascending, task1.createdAt!, task2.createdAt!));
    }
    if (columnIndex == 3) {
      tasks.sort((task1, task2) => compareString(
          ascending, task1.taskTypeModel!.name!, task2.taskTypeModel!.name!));
    }
    sortColumnIndex.value = columnIndex;
    isAscending.value = ascending;
  }

  compareString(bool ascending, String name, String name2) =>
      ascending ? name.compareTo(name2) : name2.compareTo(name);

  compareDates(bool ascending, DateTime? date, DateTime? date2) {
    if (date == null && date2 == null) return 0;
    if (date == null) return 1;
    if (date2 == null) return 1;
    return ascending ? date.compareTo(date2) : date2.compareTo(date);
  }
}
