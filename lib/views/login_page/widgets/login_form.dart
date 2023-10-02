import 'package:enelsis/utils/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            CustomWidgets.generateTextField(usernameController, "Kullanıcı Adı",
                (value) {
              if (value == null || value.isEmpty) {
                return "Bu alan boş olamaz";
              }
              return null;
            }),
            SizedBox(
              height: 10.h,
            ),
            CustomWidgets.generateTextField(passwordController, "Şifre",
                (value) {
              if (value == null || value.isEmpty) {
                return "Bu alan boş olamaz";
              }
              return null;
            }),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {}
                  Get.offAllNamed("/home");
                },
                child: const Text("Giriş Yap"))
          ],
        ));
  }
}
