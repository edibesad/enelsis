import 'package:enelsis/controller/machines_controller.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMachinePage extends StatelessWidget {
  ManageMachinePage({super.key});

  final MachinesController machinesController = Get.put(MachinesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Makineleri yönet")),
      body: FutureBuilder<List<MachineModel>>(
        future: machinesController.getMachines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: const Icon(Icons.precision_manufacturing),
                title: Text(snapshot.data![index].name!),
                subtitle: Text(snapshot.data![index].department!.name!),
                trailing: IconButton(
                  onPressed: () {
                    Get.toNamed("/edit_machine",
                        arguments: snapshot.data![index]);
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
