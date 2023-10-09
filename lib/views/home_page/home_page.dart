import 'package:enelsis/controller/login_controller.dart';
import 'package:enelsis/views/machines_production_page/machines_production_page.dart';
import 'package:enelsis/views/machines_electonic_page/machines_electronic_page.dart';
import 'package:enelsis/views/tasks_page/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile_page/profile_page.dart';

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

  List<Widget> pages = [
    const MachinesProductionPage(),
    MachinesElectronicPage(),
    const TasksPage(),
    const ProfilePage()
  ];
  List<String> titles = const [
    "Makineler",
    "Makineler 2",
    "Görevler",
    "Profil"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[activeIndex]),
      ),
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: activeIndex,
          onTap: (value) {
            setState(() {
              activeIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Makineler",
              icon: Icon(Icons.precision_manufacturing),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Makineler 2"),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Görevler"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profil"),
          ]),
    );
  }
}
