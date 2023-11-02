import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/product/view_model/user_view_model.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../view/subviews/machine_task_dialog.dart';

class MachineDetailsViewModel extends BaseViewModel {
  Rxn<MachineModel> machine = Rxn<MachineModel>();
  RxList<MachineTaskModel> tasks = RxList<MachineTaskModel>.empty();
  var isLoading = false.obs;

  var status = false.obs;
  final TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  void init() {
    if (Get.arguments is MachineModel) {
      machine.value = Get.arguments;
      getmachinesTasks();
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void showAddTaskDialog() => showDialog(
        context: viewModelContext,
        builder: (context) => MachineTaskDialog(
          viewModel: this,
        ),
      );

  getmachinesTasks() async {
    isLoading.value = true;

    BaseResponseModel<MachineTaskModel> respone = await networkManagerInstance
        .dioGet<MachineTaskModel>("/machine_tasks", MachineTaskModel(),
            queryParameters: {"machine_id": machine.value!.id});

    tasks.value = respone.dataList!;

    isLoading.value = false;
  }

  Future<void> addTask() async {
    if (formKey.currentState!.validate()) {
      var respone = await networkManagerInstance.dioPost("/machine_tasks/add", {
        "description": descController.text,
        "status": status,
        "created_by": userViewModel.user.value!.id,
        "task_type": status.value ? 1 : 2,
        "machine_id": machine.value!.id
      });
      showToast(respone.message);
      Get.back();
      getmachinesTasks();
    }
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan doldurulmalıdır';
    }
    return null;
  }

  void showToast(String? message) {
    FToast fToast = FToast();
    fToast.init(viewModelContext);
    fToast.showToast(child: Text(message ?? ""));
  }
}
