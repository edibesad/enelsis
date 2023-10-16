import 'package:enelsis/product/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCard extends StatelessWidget {
  const UserCard(this.user, {super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${user.name!} ${user.surname!}"),
        leading: const Icon(Icons.person),
        subtitle: Text(user.department!.name!),
        trailing: IconButton(
            onPressed: () {
              Get.toNamed("/edit_user", arguments: user);
            },
            icon: const Icon(Icons.edit)),
      ),
    );
  }
}
