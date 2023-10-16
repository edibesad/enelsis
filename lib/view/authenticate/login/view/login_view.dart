import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/view/authenticate/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/text_fields/custom_form_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {},
      onPageBuild: (context, viewModel) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildForm(viewModel)],
          ),
        ),
      ),
    );
  }

  buildForm(LoginViewModel viewModel) => Form(
          child: Column(
        children: [
          buildUserNameTextField(viewModel),
          SizedBox(
            height: 10.h,
          ),
          buildPasswordTextField(viewModel),
          SizedBox(
            height: 10.h,
          ),
          buildFormButton(viewModel)
        ],
      ));

  buildUserNameTextField(LoginViewModel viewModel) => CustomFormTextField(
      controller: viewModel.usernameController,
      labelText: "Kullanıcı Adı",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş olamaz";
        }
        return null;
      });
  buildPasswordTextField(LoginViewModel viewModel) => CustomFormTextField(
      controller: viewModel.passwordController,
      labelText: "Şifre",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş olamaz";
        }
        return null;
      });

  buildFormButton(LoginViewModel viewModel) => ElevatedButton(
      onPressed: viewModel.onFormButtonPress, child: const Text("Giriş Yap"));
}
