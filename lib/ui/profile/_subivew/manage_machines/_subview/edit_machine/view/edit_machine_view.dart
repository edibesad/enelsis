import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/_subview/edit_machine/view_model/edit_machine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/components/text_fields/custom_form_textfield.dart';

class EditMachineView extends StatelessWidget {
  const EditMachineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {},
      viewModel: EditMachineViewModel(),
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar() => AppBar(
        title: const Text("Makine Düzenle"),
      );

  buildBody(EditMachineViewModel viewModel) => Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNameTextField(viewModel),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              buildTypeDropDown(viewModel),
              SizedBox(
                height: 20.h,
              ),
              buildMachineInfo(viewModel),
              buildButtons(viewModel)
            ],
          ),
        ),
      );

  Row buildButtons(EditMachineViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: viewModel.onSaveTap, child: const Text("Kaydet")),
        SizedBox(
          width: 50.w,
        ),
        ElevatedButton(
          onPressed: () => viewModel.onDeleteTap(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Sil"),
        ),
      ],
    );
  }

  buildTypeDropDown(EditMachineViewModel viewModel) {
    return Obx(() => DropdownButton<int?>(
          value: viewModel.typeId.value,
          items: viewModel.types
              .map((element) => DropdownMenuItem<int>(
                    value: element.id,
                    child: Text(element.name!),
                  ))
              .toList(),
          onChanged: (value) {
            viewModel.typeId.value = value;
          },
        ));
  }

  CustomFormTextField buildNameTextField(EditMachineViewModel viewModel) {
    return CustomFormTextField(
        controller: viewModel.textEditingController,
        labelText: "İsim",
        validator: (value) => null);
  }

  buildMachineInfo(EditMachineViewModel viewModel) =>
      Obx(() => viewModel.typeId.value == 2
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: CustomFormTextField(
                        controller: viewModel.boardController,
                        labelText: "Tepsi sayısı",
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                      flex: 6,
                      child: CustomFormTextField(
                        controller: viewModel.inputPerBoardController,
                        labelText: "Tepsi başına giriş sayısı",
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            )
          : Container());
}
