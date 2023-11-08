import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/production/task_history/_subview/edit_task/view_model/edit_task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/components/text_fields/custom_form_textfield.dart';
import '../../../../../../product/model/user_model.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EditTaskViewModel>(
      viewModel: EditTaskViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: buildBody(viewModel, context),
        ),
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
          buildSwitchTile(viewModel),
          SizedBox(
            height: 10.h,
          ),
          buildDateTimeButton(context, viewModel),
          SizedBox(
            height: 20.h,
          ),
          buildSaveButton(viewModel)
        ],
      ),
    );
  }

  buildSwitchTile(EditTaskViewModel viewModel) => Obx(() {
        return SwitchListTile(
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red.shade100,
            activeColor: Colors.green,
            secondary: Text(viewModel.switchValue.value ?? false
                ? "Makine çalışıyor"
                : "Makine çalışmıyor"),
            value: viewModel.switchValue.value ?? false,
            onChanged: viewModel.switchOnChanged);
      });

  ElevatedButton buildSaveButton(EditTaskViewModel viewModel) => ElevatedButton(
      onPressed: viewModel.saveButtonOnPressed, child: const Text("Kaydet"));

  OutlinedButton buildDateTimeButton(
      BuildContext context, EditTaskViewModel viewModel) {
    return OutlinedButton(
        onPressed: viewModel.onDateTimeButtonPressed,
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
            onChanged: viewModel.userOnChanged,
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
                    value: element.id, child: Text(element.name!)))
                .toList(),
            onChanged: viewModel.onMachineChanged,
          ));
  }

  buildTaskNameTextField(EditTaskViewModel viewModel) {
    return Form(
      key: viewModel.textFieldKey,
      child: CustomFormTextField(
        controller: viewModel.taksNameTextEditingController,
        labelText: "Görev açıklamsı",
        validator: viewModel.validator,
        onChanged: viewModel.onDescChanged,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Görev düzenle"),
    );
  }
}
