import 'package:enelsis/core/init/navigation/get_navigation_route.dart';
import 'package:enelsis/utils/app_router.dart';
import 'package:enelsis/utils/themes.dart';
import 'package:enelsis/view/autenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => GetMaterialApp(
        unknownRoute: AppRouter.unknownPage,
        getPages: GetNavigationRoute.getPages,
        theme: Themes.customTheme,
        home: const LoginView(),
      ),
    );
  }
}
