import 'package:enelsis/controller/user_controller.dart';
import 'package:enelsis/models/user_model.dart';
import 'package:enelsis/views/manage_users_page/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.put(UserController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kullanıcıları yönet"),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: controller.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Hata!"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => UserCard(snapshot.data![index]),
            );
          },
        ));
  }
}
