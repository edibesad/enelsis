import 'dart:convert';

import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class MachinesController extends GetxController {
  AbstractService service = SimService();

  Future<List<MachineModel>> getMachines() async {
    List<MachineModel> machines;
    String json = await service.fetchMachines();

    machines = (jsonDecode(json) as List)
        .map((e) => MachineModel.fromJson(e))
        .toList();
    return machines;
  }
}
