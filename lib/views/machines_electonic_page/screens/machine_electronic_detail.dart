import 'package:enelsis/controller/machine_electronic_controller.dart';
import 'package:enelsis/views/machines_electonic_page/widgets/board_radio.dart';
import 'package:enelsis/views/machines_electonic_page/widgets/drop_down_future.dart';
import 'package:enelsis/views/machines_electonic_page/widgets/input_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachineElectronicDetailPage extends StatefulWidget {
  const MachineElectronicDetailPage({super.key});

  @override
  State<MachineElectronicDetailPage> createState() =>
      _MachineElectronicDetailPageState();
}

class _MachineElectronicDetailPageState
    extends State<MachineElectronicDetailPage> {
  final pageController = Get.put(MachineElectronicPageController());
  @override
  void initState() {
    super.initState();
    pageController.machine.value = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dizgi"),
      ),
      body: Column(children: [
        SizedBox(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: const Text("Makine adı"),
                  subtitle: Text(pageController.machine.value!.name),
                ),
              ),
              Card(
                child: ListTile(
                    title: const Text("Ürün"),
                    trailing: DropDownFutureBuilder()),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const BoardRadio(),
              Expanded(child: InputGridView()),
            ],
          ),
        )
      ]),
    );
  }
}
