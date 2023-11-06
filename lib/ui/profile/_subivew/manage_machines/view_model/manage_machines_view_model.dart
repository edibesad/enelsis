import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/base/model/base_response_model.dart';

class ManageMachinesViewModel extends BaseViewModel {
  RxList<MachineModel> machines = RxList.empty();
  var isLoading = false.obs;

  @override
  void init() {
    getMachinesRequest();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  navigateToEdit(MachineModel machine) {
    navigation.navigateToPage(
        path: NavigationConstants.EDIT_MACHINE, data: machine);
  }

  getMachinesRequest() async {
    isLoading.value = true;
    BaseResponseModel<MachineModel> response = await networkManagerInstance
        .dioGet<MachineModel>("/machines", MachineModel());
    machines.value = response.dataList!;
    isLoading.value = false;
  }
}
