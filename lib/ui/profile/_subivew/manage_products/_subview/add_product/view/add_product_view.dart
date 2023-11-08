import 'package:enelsis/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/components/text_fields/custom_form_textfield.dart';
import '../view_model/add_product_view_model.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: AddProductViewModel(),
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

  buildAppBar(AddProductViewModel viewModel) => AppBar(
        title: const Text("Ürün ekle"),
      );

  buildBody(AddProductViewModel viewModel) => Center(
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

  Row buildButtons(AddProductViewModel viewModel) {
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

  ElevatedButton buildSaveButton(AddProductViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.onSavePressed,
      child: const Text("Kaydet"),
    );
  }
}
