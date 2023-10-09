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
  Future<String> fetchMachinesByType(int id) async {
    var json = await Future.delayed(duration).then((value) => machines);
    var data = (jsonDecode(json) as List)
        .where((element) => element["type"]["id"] == id);
    return jsonEncode(data.toList());
  }

  @override
  Future<String> fetchMachinesByTypes(List<int> ids) async {
    var json = await Future.delayed(duration).then((value) => machines);
    var data = (jsonDecode(json) as List)
        .where((element) => ids.contains(element["type"]["id"]));
    return jsonEncode(data.toList());
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
  Future<String> fetchProducts() {
    return Future.delayed(duration).then((value) => products);
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

  @override
  Future<String> fetchItemByInput(int board, int order, int productId) async {
    var json = await Future.delayed(duration).then((value) => productItems);
    return jsonEncode((jsonDecode(json) as List)
        .where((element) =>
            element["product"]["id"] == productId &&
            element["machine_input"]["order"] == order &&
            element["machine_input"]["board"] == board)
        .firstOrNull["item"]);
  }
}
