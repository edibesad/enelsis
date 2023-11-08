import 'dart:developer';

import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/models/machin_type_model.dart';
import 'package:enelsis/models/machine_info_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMachineViewModel extends BaseViewModel {
  RxnInt typeId = RxnInt();

  RxList<MachineTypeModel> types = RxList.empty();
  @override
  void init() {
    getTypes();
  }

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController boardTextEditingController = TextEditingController();
  TextEditingController inputPerBoardTextEditingController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  void typeDropdownChanged(int? value) {
    typeId.value = value!;
  }

  getTypes() async {
    BaseResponseModel<MachineTypeModel> response = await networkManagerInstance
        .dioGet<MachineTypeModel>("/machines_types", MachineTypeModel());
    types.value = response.dataList!;
  }

  Future<void> onSavePressed() async {
    if (formKey.currentState!.validate()) {
      MachineModel machine = MachineModel(
          name: nameTextEditingController.text,
          type: types.firstWhere((element) => element.id == typeId.value),
          info: typeId.value == 2
              ? MachineInfoModel(
                  numberOfBoards: int.parse(boardTextEditingController.text),
                  inputPerBoard:
                      int.parse(inputPerBoardTextEditingController.text))
              : null);
      log(machine.toJson().toString());
      BaseResponseModel response = await networkManagerInstance.dioPost(
          "/machines/add",
          machine.toJson()
            ..addAll(machine.info != null ? machine.info!.toJson() : {}));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(viewModelContext)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
  }

  String? machineNameTextFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Bu alan dolu olmalıdır";
    }
    return null;
  }

  String? machineInfoValidator(String? value) {
    if (typeId.value != null && typeId.value != 2) {
      return null;
    }

    if (value == null || value.isEmpty) {
      return "Bu alan dolu olmalıdır";
    }
    return null;
  }
}
