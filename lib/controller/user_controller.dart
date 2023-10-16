import 'dart:convert';

import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final AbstractService _service = SimService();

  Future<List<UserModel>> getUsers() async {
    String json = await _service.fetchUsers();

    return (jsonDecode(json) as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
