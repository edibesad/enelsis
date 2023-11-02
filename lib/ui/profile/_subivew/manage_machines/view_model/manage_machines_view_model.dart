import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMachinesViewModel extends BaseViewModel {
  RxList<MachineModel> machines = RxList.empty();
  var isLoading = false.obs;

  @override
  void init() {
    getMachines();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  getMachines() async {
    isLoading.value = true;
    var json = jsonDecode(await SimService().fetchMachines()) as List;
    machines.value = json.map((e) => MachineModel.fromJson(e)).toList();
    isLoading.value = false;
  }

  navigateToEdit(MachineModel machine) {
    navigation.navigateToPage(
        path: NavigationConstants.EDIT_MACHINE, data: machine);
  }
}
