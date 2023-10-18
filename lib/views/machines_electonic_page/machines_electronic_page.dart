import 'package:enelsis/controller/machine_electronic_controller.dart';
import 'package:enelsis/controller/machines_controller.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachinesElectronicPage extends StatelessWidget {
  MachinesElectronicPage({super.key});
  final machinesController = Get.put(MachinesController());
  final pageController = Get.put(MachineElectronicPageController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: machinesController.getMachinesByType(3),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Hata!\n${snapshot.error}"),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: const Icon(Icons.circle),
              title: const Text("Dizgi makinesi"),
              onTap: () {
                Get.toNamed("/machine_electronic_detail",
                    arguments: snapshot.data![index]);
              },
            ),
          ),
        );
      },
    );
  }
}
