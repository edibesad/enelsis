import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:enelsis/ui/profile/_subivew/manage_stock/_subiview/edit_stock/view_model/edit_stock_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditStockView extends StatelessWidget {
  const EditStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: EditStockViewModel(),
      onModelReady: (model) {
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(viewModel),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar(EditStockViewModel viewModel) => AppBar(
        title: Text(viewModel.stock.item!.name!),
      );

  buildBody(EditStockViewModel viewModel) => Center(
          child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormTextField(
              enabled: false,
              controller: viewModel.nameTextEditingController,
              labelText: "Malzeme ismi",
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomFormTextField(
              controller: viewModel.quantityTextEditingController,
              labelText: "Miktar",
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomFormTextField(
              enabled: false,
              controller: viewModel.unitTextEditingController,
              labelText: "Birimi",
            ),
            SizedBox(
              height: 20.h,
            ),
            buildButtons(viewModel)
          ],
        ),
      ));

  Row buildButtons(EditStockViewModel viewModel) {
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

  ElevatedButton buildSaveButton(EditStockViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.onSavePressed,
      child: const Text("Kaydet"),
    );
  }
}
