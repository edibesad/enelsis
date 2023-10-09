import 'package:enelsis/controller/home_controller.dart';
import 'package:enelsis/controller/login_controller.dart';
import 'package:enelsis/views/home_page/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

late LoginController loginController;
int activeIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loginController = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(homeController.pageTitle.value)),
      ),
      body: Obx(() => homeController.homePage.value),
      drawer: const AppDrawer(),
    );
  }
}
