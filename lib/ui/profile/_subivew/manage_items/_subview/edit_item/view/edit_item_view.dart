import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/_subview/edit_item/view_model/edit_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditItemView extends StatelessWidget {
  const EditItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: EditItemViewModel(),
      onPageBuild: (context, viewModel) => Scaffold(
        body: buildBody(viewModel),
      ),
    );
  }

  buildBody(EditItemViewModel viewModel) => Form(
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
      );

  Row buildButtons(EditItemViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSaveButton(viewModel),
        SizedBox(
          width: 20.w,
        ),
        buildDeleteButton(viewModel)
      ],
    );
  }

  buildSaveButton(EditItemViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.onSavePressed,
      child: const Text("Kaydet"),
    );
  }

  buildDeleteButton(EditItemViewModel viewModel) => ElevatedButton(
        onPressed: viewModel.onDeletePressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Sil"),
      );
}
