import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/_subview/add_item/view_model/add_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddItemView extends StatelessWidget {
  const AddItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: AddItemViewModel(),
      onModelReady: (model) {
        model.viewModelContext = context;
      },
      onPageBuild: (context, viewModel) => Scaffold(
        body: buildBody(viewModel),
      ),
    );
  }

  buildBody(AddItemViewModel viewModel) => Center(
          child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormTextField(
              controller: viewModel.nameTextEditingController,
              labelText: "Malzeme ismi",
              validator: viewModel.validator,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomFormTextField(
              controller: viewModel.unitTextEditingController,
              labelText: "Birimi",
              validator: viewModel.validator,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildButtons(viewModel)
          ],
        ),
      ));

  Row buildButtons(AddItemViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSaveButton(viewModel),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }

  ElevatedButton buildSaveButton(AddItemViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.onSavePressed,
      child: const Text("Kaydet"),
    );
  }
}
