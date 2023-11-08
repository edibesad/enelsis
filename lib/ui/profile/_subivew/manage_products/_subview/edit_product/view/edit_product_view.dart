import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/_subview/edit_product/view_model/edit_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/text_fields/custom_form_textfield.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: EditProdcutViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(viewModel),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar(EditProdcutViewModel viewModel) => AppBar(
        title: Text(viewModel.product.name!),
      );

  buildBody(EditProdcutViewModel viewModel) => Center(
          child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormTextField(
              controller: viewModel.textEditingController,
              labelText: "Ürün ismi",
              validator: viewModel.validator,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildButtons(viewModel)
          ],
        ),
      ));

  Row buildButtons(EditProdcutViewModel viewModel) {
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

  ElevatedButton buildDeleteButton(EditProdcutViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.onDeletePressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Sil"),
    );
  }

  ElevatedButton buildSaveButton(EditProdcutViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.onSavePressed,
      child: const Text("Kaydet"),
    );
  }
}
