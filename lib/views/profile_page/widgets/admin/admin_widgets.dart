import 'package:enelsis/views/profile_page/widgets/admin/admin_widget_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminWidgets extends StatelessWidget {
  const AdminWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: [
        AdminWidgetCard(
          icon: const Icon(
            Icons.display_settings,
            size: 36,
          ),
          title: "Makineleri Yönet",
          onTap: () {
            Get.toNamed("/manage_machines");
          },
        ),
        AdminWidgetCard(
          icon: const Icon(
            Icons.manage_accounts,
            size: 36,
          ),
          title: "Kullanıcıları yönet",
          onTap: () {
            Get.toNamed("/manage_users");
          },
        ),
        AdminWidgetCard(
          icon: const Icon(
            Icons.task,
            size: 36,
          ),
          title: "Görevleri Yönet",
          onTap: () {
            Get.toNamed("/manage_tasks", arguments: true);
          },
        ),
        AdminWidgetCard(
            icon: const Icon(Icons.developer_board),
            title: "Ürünleri Yönet",
            onTap: () {
              Get.toNamed("/manage_products");
            })
      ],
    );
  }
}
