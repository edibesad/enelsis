import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/view/production/machines/model/machine_model.dart';
import 'package:enelsis/view/production/machines/model/machine_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionMachinesViewModel extends BaseViewModel {
  @override
  void init() {
    print("init");
    getMachinesRequest();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  RxList<MachineModel> machines = RxList<MachineModel>([]);
  var isLoading = false.obs;

  getMachinesRequest() async {
    isLoading.value = true;
    //TODO değiştirilecek
    try {
      machines.value =
          (jsonDecode(await SimService().fetchMachinesByType(1)) as List)
              .map((e) => MachineModel.fromJson(e))
              .toList();
      for (var element in machines) {
        element.task = MachineTaskModel().fromJson(jsonDecode(
            await SimService().fetchActiveTaskByMachineId(element.id)));
      }
      print(machines);
    } catch (e) {
      if (viewModelContext.mounted) {
        showDialog(
          context: viewModelContext,
          builder: (context) => AlertDialog(
              title: const Text("Hata!"),
              content: Center(child: Text("Hata : $e"))),
        );
      }
    }
    isLoading.value = false;
  }
}
