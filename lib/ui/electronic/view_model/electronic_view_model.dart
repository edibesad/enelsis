import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/model/machine_model.dart';

class ElectronicViewModel extends BaseViewModel {
  RxList<MachineModel> machines = RxList.empty();
  var isLoading = false.obs;

  @override
  void init() {
    getMachines();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  navigateToDetails(MachineModel machine) {
    navigation.navigateToPage(
        path: NavigationConstants.MACHINE_ELECTRONIC_DETAIL, data: machine);
  }

  Future<void> getMachines() async {
    isLoading.value = true;
    String json = await SimService().fetchMachinesByType(3);
    machines.value = (jsonDecode(json) as List)
        .map((e) => MachineModel.fromJson(e))
        .toList();
    isLoading.value = false;
  }
}
