import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionMachinesViewModel extends BaseViewModel {
  @override
  void init() {
    getMachinesRequest();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  RxList<MachineModel> machines = RxList<MachineModel>([]);
  var isLoading = false.obs;

  getMachinesRequest() async {
    isLoading.value = true;
    BaseResponseModel<MachineModel> response = await networkManagerInstance
        .dioGet("/machines", MachineModel(), queryParameters: {"type_id": 1});
    machines.value = response.dataList!;
    debugPrint(response.message);
    isLoading.value = false;
  }

  navigateDetails(MachineModel machine) {
    navigation.navigateToPage(
        path: NavigationConstants.PRODUCTIN_MACHINE_DETAILS, data: machine);
  }
}
