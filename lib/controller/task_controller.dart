import 'dart:convert';

import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  AbstractService service = SimService();
  Future<List<MachineTaskModel>> getAllTasks() async {
    String json = await service.fetchTasks();

    return (jsonDecode(json) as List)
        .map((e) => MachineTaskModel.fromJson(e))
        .toList();
  }

  Future<List<MachineTaskModel>> getTasksByMachine(int id) async {
    String json = await service.fetchTasksByMachineId(id);

    return (jsonDecode(json) as List)
        .map((e) => MachineTaskModel.fromJson(e))
        .toList();
  }

  Future<MachineTaskModel> getActiveTask(int id) async {
    String json = await service.fetchActiveTaskByMachineId(id);
    return MachineTaskModel.fromJson(jsonDecode(json));
  }
}
