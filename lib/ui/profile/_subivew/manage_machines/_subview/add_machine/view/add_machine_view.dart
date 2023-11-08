import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/_subview/add_machine/view_model/add_machine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddMachineView extends StatelessWidget {
  const AddMachineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: AddMachineViewModel(),
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar() => AppBar();

  buildBody(AddMachineViewModel viewModel) => Center(
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMachineNameTextField(viewModel),
              SizedBox(
                height: 10.h,
              ),
              buildMachineTypeDropdown(viewModel),
              buildMachineInfoFields(viewModel),
              SizedBox(
                height: 10.h,
              ),
              buildSaveButton(viewModel)
            ],
          ),
        ),
      );

  buildMachineNameTextField(AddMachineViewModel viewModel) =>
      CustomFormTextField(
        controller: viewModel.nameTextEditingController,
        labelText: "Makine ismi",
        validator: viewModel.machineNameTextFieldValidator,
      );

  buildMachineTypeDropdown(AddMachineViewModel viewModel) =>
      Obx(() => DropdownButton<int?>(
          value: viewModel.typeId.value,
          items: viewModel.types
              .map<DropdownMenuItem<int>>((element) => DropdownMenuItem<int>(
                    value: element.id,
                    child: Text(element.name!),
                  ))
              .toList(),
          onChanged: viewModel.typeDropdownChanged));

  buildMachineInfoFields(AddMachineViewModel viewModel) =>
      Obx(() => viewModel.typeId.value == 2
          ? Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CustomFormTextField(
                  controller: viewModel.boardTextEditingController,
                  labelText: "Tepsi sayısı",
                  validator: viewModel.machineInfoValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormTextField(
                  controller: viewModel.inputPerBoardTextEditingController,
                  labelText: "Tepsi başına giriş sayısı",
                  keyboardType: TextInputType.number,
                  validator: viewModel.machineInfoValidator,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                )
              ],
            )
          : const SizedBox());

  buildSaveButton(AddMachineViewModel viewModel) => ElevatedButton(
      onPressed: viewModel.onSavePressed, child: const Text("Kaydet"));
}
