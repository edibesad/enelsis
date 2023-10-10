import 'dart:convert';

import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class MachinesController extends GetxController {
  final AbstractService _service = SimService();

  Future<List<MachineModel>> getMachines() async {
    String json = await _service.fetchMachines();

    return (jsonDecode(json) as List)
        .map((e) => MachineModel.fromJson(e))
        .toList();
  }

  Future<List<MachineModel>> getMachinesByType(int id) async {
    String json = await _service.fetchMachinesByType(id);
    var machines = (jsonDecode(json) as List)
        .map((e) => MachineModel.fromJson(e))
        .toList();
    return machines;
  }

  Future<List<MachineModel>> getMachinesByTypes(List<int> ids) async {
    String json = await _service.fetchMachinesByTypes(ids);
    var machines = (jsonDecode(json) as List)
        .map((e) => MachineModel.fromJson(e))
        .toList();
    return machines;
  }
}
