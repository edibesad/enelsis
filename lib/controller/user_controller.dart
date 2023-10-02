import 'dart:convert';

import 'package:enelsis/models/user_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  AbstractService service = SimService();

  Future<List<UserModel>> getUsers() async {
    String json = await service.fetchUsers();

    return (jsonDecode(json) as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
