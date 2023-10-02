import 'package:enelsis/views/profile_page/widgets/admin/admin_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AdminWidgets(),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed("/login");
                  },
                  child: const Text("Çıkış Yap")),
            ],
          ),
        ),
      ),
    );
  }
}
