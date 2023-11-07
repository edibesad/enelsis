import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:enelsis/ui/electronic/_subview/add_input/view_model/add_input_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddInputView extends StatelessWidget {
  const AddInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: AddInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        body: buildBody(viewModel),
      ),
    );
  }

  buildBody(AddInputViewModel viewModel) => Center(
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBoardTextField(viewModel),
                SizedBox(
                  height: 20.h,
                ),
                buildInputTextField(viewModel),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildItemDropdown(viewModel),
                    SizedBox(
                      width: 20.w,
                    ),
                    buildProductDropdown(viewModel),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    onPressed: viewModel.saveOnPressed,
                    child: const Text("Ekle"))
              ],
            ),
          ),
        ),
      );

  CustomFormTextField buildBoardTextField(AddInputViewModel viewModel) {
    return CustomFormTextField(
      enabled: false,
      controller: viewModel.boardTextEditingController,
      labelText: "Tepsi Numarası",
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş olamaz";
        }
        return null;
      },
      onChanged: viewModel.onBoardTextFieldChanged,
    );
  }

  CustomFormTextField buildInputTextField(AddInputViewModel viewModel) {
    return CustomFormTextField(
      enabled: false,
      controller: viewModel.inputTextEditingController,
      labelText: "Giriş Numarası",
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş olamaz";
        }
        return null;
      },
      onChanged: viewModel.onInputTextFieldChanged,
    );
  }

  buildItemDropdown(AddInputViewModel viewModel) {
    return Obx(() => DropdownButton<int>(
          value: viewModel.itemId.value,
          items: viewModel.items
              .map<DropdownMenuItem<int>>(
                (element) => DropdownMenuItem(
                  value: element.id,
                  child: Text(element.name!),
                ),
              )
              .toList(),
          onChanged: viewModel.itemDropdownOnChanged,
        ));
  }

  buildProductDropdown(AddInputViewModel viewModel) {
    return Obx(() => DropdownButton<int>(
          value: viewModel.productId.value,
          items: viewModel.products
              .map<DropdownMenuItem<int>>((element) => DropdownMenuItem(
                  value: element.id, child: Text(element.name!)))
              .toList(),
          onChanged: viewModel.productDropdownOnChanged,
        ));
  }
}
