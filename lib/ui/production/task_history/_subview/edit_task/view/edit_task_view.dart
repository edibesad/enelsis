import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/production/task_history/_subview/edit_task/view_model/edit_task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../../../../core/components/text_fields/custom_form_textfield.dart';
import '../../../../../../product/model/user_model.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EditTaskViewModel>(
      viewModel: EditTaskViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(viewModel, context),
      ),
    );
  }

  Center buildBody(EditTaskViewModel viewModel, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTaskNameTextField(viewModel),
          SizedBox(
            height: 10.h,
          ),
          buildDropdownButtons(viewModel),
          SizedBox(
            height: 10.h,
          ),
          buildDateTimeButton(context),
          SizedBox(
            height: 20.h,
          ),
          buildSaveButton()
        ],
      ),
    );
  }

  ElevatedButton buildSaveButton() =>
      ElevatedButton(onPressed: () {}, child: const Text("Kaydet"));

  OutlinedButton buildDateTimeButton(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          showOmniDateTimePicker(
            context: context,
            is24HourMode: true,
            isForce2Digits: true,
          );
        },
        child: const Text("Tarih seç"));
  }

  Row buildDropdownButtons(EditTaskViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMachinesDropdown(viewModel),
        SizedBox(
          width: 50.w,
        ),
        buildUsersDropdown(viewModel),
      ],
    );
  }

  Widget buildUsersDropdown(EditTaskViewModel viewModel) {
    return Obx(() => viewModel.isMachinesLoading.value
        ? const LoadingWidget()
        : DropdownButton<int?>(
            value: viewModel.userId.value,
            items: [
              for (UserModel element in viewModel.users)
                DropdownMenuItem(
                  value: element.id,
                  child: Text("${element.name!} ${element.surname!}"),
                )
            ],
            onChanged: (value) {
              viewModel.userId.value = value!;
            },
          ));
  }

  Widget buildMachinesDropdown(EditTaskViewModel viewModel) {
    return Obx(() => viewModel.isMachinesLoading.value
        ? const LoadingWidget()
        : DropdownButton<int?>(
            hint: const Text("Makine"),
            value: viewModel.machineId.value,
            items: viewModel.machines
                .map<DropdownMenuItem<int>>((element) => DropdownMenuItem(
                    value: element.id, child: Text(element.name)))
                .toList(),
            onChanged: (value) {
              viewModel.machineId.value = value!;
            },
          ));
  }

  CustomFormTextField buildTaskNameTextField(EditTaskViewModel viewModel) {
    return CustomFormTextField(
        controller: viewModel.taksNameTextEditingController,
        labelText: "Görev adı",
        validator: (value) => null);
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Görev düzele"),
    );
  }
}
