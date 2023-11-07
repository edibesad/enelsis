import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
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

  getMachines() async {
    isLoading.value = true;
    final response = await networkManagerInstance
        .dioGet("/machines", MachineModel(), queryParameters: {"type_id": 2});
    machines.value = response.dataList!;
    isLoading.value = false;
  }
}
