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
        model.init();
        model.setContext(context);
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFormTextField(
            controller: viewModel.textEditingController,
            labelText: "Ürün ismi",
          ),
          SizedBox(
            height: 20.h,
          ),
          buildButtons()
        ],
      ));

  Row buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSaveButton(),
        SizedBox(
          width: 20.w,
        ),
        buildDeleteButton()
      ],
    );
  }

  ElevatedButton buildDeleteButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Sil"),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text("Kaydet"),
    );
  }
}
