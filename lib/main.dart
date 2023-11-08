import 'package:enelsis/core/init/navigation/get_navigation_route.dart';
import 'package:enelsis/ui/profile/_subivew/manage_stock/view/manage_stock_view.dart';
import 'package:enelsis/utils/app_router.dart';
import 'package:enelsis/utils/themes.dart';
import 'package:enelsis/ui/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
        locale: const Locale('en'),
        unknownRoute: AppRouter.unknownPage,
        getPages: GetNavigationRoute.getPages,
        theme: Themes.customTheme,
        home: const LoginView(),
      ),
    );
  }
}

class DevApp extends StatelessWidget {
  const DevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        builder: FToastBuilder(),
        supportedLocales: const [Locale('en'), Locale('tr')],
        locale: const Locale('tr'),
        unknownRoute: AppRouter.unknownPage,
        getPages: GetNavigationRoute.getPages,
        theme: Themes.customTheme,
        home: Scaffold(body: Builder(builder: (context) {
          return const ManageStockView();
        })),
      ),
    );
  }
}
