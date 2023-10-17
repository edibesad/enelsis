import 'dart:convert';

import 'package:enelsis/view/production/_model/machine_task_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final AbstractService _service = SimService();
  Future<List<MachineTaskModel>> getAllTasks() async {
    String json = await _service.fetchTasks();

    return (jsonDecode(json))
        .map((e) => MachineTaskModel().fromJson(e))
        .toList();
  }

  Future<List<MachineTaskModel>> getTasksByMachine(int id) async {
    String json = await _service.fetchTasksByMachineId(id);

    return (jsonDecode(json))
        .map((e) => MachineTaskModel().fromJson(e))
        .toList();
  }

  Future<MachineTaskModel> getActiveTask(int id) async {
    String json = await _service.fetchActiveTaskByMachineId(id);
    return MachineTaskModel().fromJson(jsonDecode(json));
  }
}
