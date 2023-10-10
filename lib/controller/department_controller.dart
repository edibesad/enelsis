import 'dart:convert';

import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class DepartmentController extends GetxController {
  final AbstractService _service = SimService();

  Future<List<DepartmentModel>> getDepartments() async {
    List<DepartmentModel> departments;
    String json = await _service.fetchDepartments();

    departments = (jsonDecode(json) as List)
        .map((e) => DepartmentModel.fromJson(e))
        .toList();
    return departments;
  }
}
