import 'dart:convert';

import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/utils/data_const.dart';

class SimService extends AbstractService {
  Duration duration = const Duration(milliseconds: 500);
  // Duration duration = const Duration(seconds: 2);

  @override
  Future<String> fetchDepartments() {
    return Future.delayed(duration).then((value) => departments);
  }

  @override
  Future<String> fetchMachines() {
    return Future.delayed(duration).then((value) => machines);
  }

  @override
  Future<String> fetchTasks() {
    return Future.delayed(duration).then((value) => tasks);
  }

  @override
  Future<String> fetchUsers() {
    return Future.delayed(duration).then((value) => users);
  }

  @override
  Future<String> fetchTasksByMachineId(int id) async {
    var json = await Future.delayed(duration).then((value) => tasks);
    var data = (jsonDecode(json) as List)
        .where((element) => element["machine"]["id"] == id);
    return jsonEncode(data.toList());
  }

  @override
  Future<String> fetchActiveTaskByMachineId(int id) async {
    var json = await Future.delayed(duration).then((value) => tasks);
    var data = (jsonDecode(json) as List).where((element) {
      return element["machine"]["id"] == id;
    }).toList();
    // print(data);

    return jsonEncode(data.last);
  }
}
