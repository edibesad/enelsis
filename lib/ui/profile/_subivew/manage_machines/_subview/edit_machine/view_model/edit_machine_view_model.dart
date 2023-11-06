import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/models/machin_type_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/view_model/manage_machines_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMachineViewModel extends BaseViewModel {
  late MachineModel machine;
  RxList<MachineTypeModel> types = RxList.empty();

  TextEditingController textEditingController = TextEditingController();

  var isTypesLoading = false.obs;
  RxnInt typeId = RxnInt();

  TextEditingController boardController = TextEditingController();

  TextEditingController inputPerBoardController = TextEditingController();

  onDeleteTap() {
    showDialog(
      context: viewModelContext,
      builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(
                onPressed: () async {
                  final response = await networkManagerInstance.dioDelete(
                      "/machines/delete/${machine.id}",
                      queryParameters: machine.info != null
                          ? {"machine_info_id": machine.info!.id}
                          : null);
                  Get.back();
                  Get.back();
                  showSnackBar(response.message!);
                  Get.put(ManageMachinesViewModel()).getMachinesRequest();
                },
                child: const Text("Evet")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("İptal"))
          ],
          title: const Text("Uyarı!"),
          content: const Text("Makineyi silmek istediğinizden emin misiniz?")),
    );
  }

  @override
  void init() {
    if (Get.arguments is MachineModel) {
      machine = Get.arguments;
      textEditingController.text = machine.name!;
      typeId.value = machine.type!.id;
      getTypes();
      if (machine.info != null) {
        boardController.text = machine.info!.numberOfBoards.toString();
        inputPerBoardController.text = machine.info!.inputPerBoard.toString();
      }
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  Future<void> getTypes() async {
    isTypesLoading.value = true;

    final response = await networkManagerInstance.dioGet(
        "/machines_types", MachineTypeModel());

    types.value = response.dataList!;
    isTypesLoading.value = false;
  }

  onSaveTap() async {
    if (typeId.value == 2) {
      final response = await networkManagerInstance
          .dioPost("/machines/update/${machine.id}", {
        "name": textEditingController.text,
        "type_id": typeId.value,
        "number_of_boards": int.parse(boardController.text),
        "input_per_board": int.parse(inputPerBoardController.text)
      });
      showSnackBar(response.message!);
      Get.back();
      Get.put(ManageMachinesViewModel()).getMachinesRequest();
    } else {
      final response = await networkManagerInstance.dioPost(
          "/machines/update/${machine.id}",
          {"name": textEditingController.text, "type_id": typeId.value});
      showSnackBar(response.message!);
      Get.back();
      Get.put(ManageMachinesViewModel()).getMachinesRequest();
    }
  }

  showSnackBar(String msg) => ScaffoldMessenger.of(viewModelContext)
      .showSnackBar(SnackBar(content: Text(msg)));
}
