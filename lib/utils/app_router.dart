import 'package:enelsis/views/home_page/home_page.dart';
import 'package:enelsis/views/login_page/login_page.dart';
import 'package:enelsis/views/manage_machine_page/manage_machine_page.dart';
import 'package:enelsis/views/manage_machine_page/screen/edit_machine_screen.dart';
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
    )
  ];

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case homeRote:
  //       return MaterialPageRoute(
  //         builder: (context) => const HomePage(),
  //       );
  //     case loginRoute:
  //       return MaterialPageRoute(
  //         builder: (context) => const LoginPage(),
  //       );
  //     case addTaskRoute:
  //       return MaterialPageRoute(
  //         builder: (context) => const AddTaskPage(),
  //       );
  //     default:
  //       return MaterialPageRoute(
  //         builder: (context) => Scaffold(
  //           appBar: AppBar(),
  //           body: const Center(child: Text("Hata!")),
  //         ),
  //       );
  //   }
  // }
}

// const String loginRoute = "/login";
// const String homeRote = "/home";
// const String addTaskRoute = "/add_task";
