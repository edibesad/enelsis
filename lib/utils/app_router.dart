import 'package:enelsis/views/home_page/home_page.dart';
import 'package:enelsis/views/login_page/login_page.dart';
import 'package:enelsis/views/machines_electonic_page/screens/item_control_screen_with_barcode.dart';
import 'package:enelsis/views/machines_electonic_page/screens/machine_electronic_detail.dart';
import 'package:enelsis/views/manage_machine_page/manage_machine_page.dart';
import 'package:enelsis/views/manage_machine_page/screen/edit_machine_screen.dart';
import 'package:enelsis/views/manage_products/manage_products.dart';
import 'package:enelsis/views/manage_products/screens/edit_product_screen.dart';
import 'package:enelsis/views/manage_task_page/manage_task_page.dart';
import 'package:enelsis/views/manage_task_page/screen/edit_task_screen.dart';
import 'package:enelsis/views/manage_users_page/manage_users_page.dart';
import 'package:enelsis/views/manage_users_page/screen/edit_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static final unknownPage = GetPage(
    name: "/unknown",
    page: () => Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Hata!")),
    ),
  );

  static final getPages = [
    GetPage(
      name: "/home",
      page: () => const HomePage(),
    ),
    GetPage(
      name: "/login",
      page: () => const LoginPage(),
    ),
    GetPage(
      name: "/manage_users",
      page: () => const ManageUsersPage(),
    ),
    GetPage(
      name: "/edit_user",
      page: () => const EditUserScreen(),
    ),
    GetPage(
      name: "/manage_tasks",
      page: () => ManageTasksPage(),
    ),
    GetPage(
      name: "/edit_task",
      page: () => const EditTaskScreen(),
    ),
    GetPage(
      name: "/manage_machines",
      page: () => ManageMachinePage(),
    ),
    GetPage(
      name: "/edit_machine",
      page: () => const EditMachineScreen(),
    ),
    GetPage(
      name: "/machine_electronic_detail",
      page: () => const MachineElectronicDetailPage(),
    ),
    GetPage(
      name: "/item_control",
      page: () => const ItemControlScreen(),
    ),
    GetPage(
      name: "/manage_products",
      page: () => const ManageProducts(),
    ),
    GetPage(
      name: "/edit_product",
      page: () => const EditProductScreen(),
    )
  ];
}
