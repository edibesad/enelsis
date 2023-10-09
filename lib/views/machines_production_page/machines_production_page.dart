import 'package:enelsis/controller/machines_controller.dart';
import 'package:enelsis/controller/task_controller.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/utils/widgets/shimmer_list_tile.dart';
import 'package:enelsis/views/machines_production_page/widgets/machine_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachinesProductionPage extends StatelessWidget {
  const MachinesProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    MachinesController machinesController = Get.put(MachinesController());
    TaskController taskController = Get.put(TaskController());

    return SafeArea(
      child: FutureBuilder<List<MachineModel>>(
        future: machinesController.getMachinesByTypes([1, 2]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Hata!\n${snapshot.error}"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => FutureBuilder<MachineTaskModel>(
              future: taskController.getActiveTask(snapshot.data![index].id),
              builder: (context, snapshot2) {
                if (snapshot2.connectionState == ConnectionState.waiting) {
                  return const ShimmerListTile();
                }
                if (snapshot2.hasError) {
                  return Center(
                    child: Text("Hata!\n${snapshot2.error}"),
                  );
                }
                return MachineCard(
                    activeTask: snapshot2.data!,
                    machineModel: snapshot.data![index]);
              },
            ),
          );
        },
      ),
    );
  }
}
