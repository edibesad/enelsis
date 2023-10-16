import 'package:enelsis/views/home_page/home_page.dart';
import 'package:enelsis/view/autenticate/login/view/login_view.dart';
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
import 'package:enelsis/views/stocks_page/stocks_history/stocks_history.dart';
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
}
