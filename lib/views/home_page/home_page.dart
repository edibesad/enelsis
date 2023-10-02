import 'package:enelsis/controller/login_controller.dart';
import 'package:enelsis/views/machines_page/machines_page.dart';
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

  List<Widget> pages = const [MachinesPage(), TasksPage(), ProfilePage()];
  List<String> titles = const ["Makineler", "Görevler", "Profil"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[activeIndex]),
      ),
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Görevler"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profil"),
          ]),
    );
  }
}
