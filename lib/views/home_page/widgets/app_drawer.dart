import 'package:enelsis/controller/home_controller.dart';
import 'package:enelsis/views/machines_electonic_page/machines_electronic_page.dart';
import 'package:enelsis/views/machines_production_page/machines_production_page.dart';
import 'package:enelsis/views/profile_page/profile_page.dart';
import 'package:enelsis/views/tasks_page/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItems = [
      const ListTile(
        subtitle: Text("Üretim"),
      ),
      ListTile(
        leading: const Icon(Icons.precision_manufacturing),
        title: const Text("Makineler"),
        onTap: () {
          Get.back();
          homeController.homePage.value = const MachinesProductionPage();
          homeController.pageTitle.value = "Makineler";
        },
      ),
      ListTile(
        onTap: () {
          Get.back();
          homeController.homePage.value = const TasksPage();
          homeController.pageTitle.value = "Görev geçmişi";
        },
        leading: const Icon(Icons.history),
        title: const Text("Görev geçmişi"),
      ),
      const Divider(),
      const ListTile(
        subtitle: Text("Elektronik"),
      ),
      ListTile(
        onTap: () {
          Get.back();
          homeController.homePage.value = MachinesElectronicPage();
          homeController.pageTitle.value = "Makineler";
        },
        leading: const Icon(Icons.precision_manufacturing),
        title: const Text("Makineler"),
      )
    ];
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
            onDetailsPressed: () {
              Get.back();
              homeController.homePage.value = const ProfilePage();
              homeController.pageTitle.value = "Profil";
            },
            accountName: const Text("Edib Esad Galip"),
            accountEmail: const Text("edibesad@gmail.com")),
        ...drawerItems,
      ]),
    );
  }
}
