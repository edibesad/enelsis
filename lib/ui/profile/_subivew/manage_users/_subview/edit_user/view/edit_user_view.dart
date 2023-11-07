import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_users/_subview/edit_user/view_model/edit_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/components/text_fields/custom_form_textfield.dart';

class EditUserView extends StatelessWidget {
  const EditUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EditUserViewModel>(
      viewModel: EditUserViewModel(),
      onModelReady: (model) {},
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar() => AppBar(
        title: const Text("Kullanıcı Düzenle"),
      );

  buildBody(EditUserViewModel viewModel) => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFormTextField(
                    controller: viewModel.userNameTextEditingController,
                    labelText: "Kullanıcı adı",
                    validator: (value) => null),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormTextField(
                    controller: viewModel.nameTextEditingController,
                    labelText: "İsim",
                    validator: (value) => null),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormTextField(
                    controller: viewModel.surnameTextEditingController,
                    labelText: "Soyisim",
                    validator: (value) => null),
                SizedBox(
                  height: 20.h,
                ),
                buildCanEditUserChechbox(viewModel),
                SizedBox(
                  width: 20.w,
                ),
                buildCanEditTaskCheckbox(viewModel),
                SizedBox(
                  height: 30.h,
                ),
                buildButtons(viewModel)
              ],
            ),
          ),
        ),
      );

  Row buildButtons(EditUserViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Kaydet")),
        SizedBox(
          width: 50.w,
        ),
        ElevatedButton(
          onPressed: () => viewModel.onDeletePressed(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Sil"),
        ),
      ],
    );
  }

  buildCanEditTaskCheckbox(EditUserViewModel viewModel) {
    return Obx(() => CheckboxListTile(
          title: const Text("Görevleri düzenleyebilir"),
          value: viewModel.canEditTasks.value,
          onChanged: (value) {
            viewModel.canEditTasks.value = value!;
          },
        ));
  }

  buildCanEditUserChechbox(EditUserViewModel viewModel) {
    return Obx(() => CheckboxListTile(
          title: const Text("Kullanıcıları düzenleyebilir"),
          value: viewModel.canEditUsers.value,
          onChanged: (value) {
            viewModel.canEditUsers.value = value!;
          },
        ));
  }
}
