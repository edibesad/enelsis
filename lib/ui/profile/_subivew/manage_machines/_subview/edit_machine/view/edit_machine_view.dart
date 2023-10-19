import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/_subview/edit_machine/view_model/edit_machine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/components/text_fields/custom_form_textfield.dart';

class EditMachineView extends StatelessWidget {
  const EditMachineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNameTextField(),
            SizedBox(
              height: 10.h,
            ),
            buildDepartmentsDropDown(viewModel),
            SizedBox(
              height: 10.h,
            ),
            buildTypeDropDown(viewModel),
            SizedBox(
              height: 20.h,
            ),
            buildButtons(viewModel)
          ],
        ),
      );

  Row buildButtons(EditMachineViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Kaydet")),
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
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text("Cnc makinesi"),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text("Dizgi makinesi"),
            )
          ],
          onChanged: (value) {
            viewModel.typeId.value = value;
          },
        ));
  }

  Widget buildDepartmentsDropDown(EditMachineViewModel viewModel) =>
      Obx(() => viewModel.isDepartmentsLoading.value
          ? const LoadingWidget()
          : DropdownButton<int?>(
              value: viewModel.depId.value,
              items: viewModel.departments
                  .map((element) => DropdownMenuItem(
                        value: element.id,
                        child: Text(element.name!),
                      ))
                  .toList(),

              //   viewModel.
              //   for (DepartmentModel element in viewModel.departments)
              //     DropdownMenuItem(
              //       value: element.id,
              //       child: Text(element.name!),
              //     )
              // ],
              onChanged: (value) {
                viewModel.depId.value = value;
              },
            ));

  CustomFormTextField buildNameTextField() {
    return CustomFormTextField(
        controller: TextEditingController(),
        labelText: "İsim",
        validator: (value) => null);
  }
}
