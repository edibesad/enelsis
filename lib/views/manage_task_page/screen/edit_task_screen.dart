import 'package:enelsis/controller/machines_controller.dart';
import 'package:enelsis/controller/user_controller.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/machine_task_model.dart';
import 'package:enelsis/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late MachineTaskModel task;
  late TextEditingController taksNameTextEditingController;
  late int machineId, userId;
  late List<MachineModel> machines = [];
  late List<UserModel> users = [];

  @override
  initState() {
    super.initState();
    task = Get.arguments as MachineTaskModel;
    taksNameTextEditingController = TextEditingController(text: task.name);
    machineId = task.machine!.id;
    userId = task.createdBy!.id!;
    getItemsFromService();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<MachinesController>();
    Get.delete<UserController>();
  }

  final MachinesController machinesController = Get.put(MachinesController());
  final UserController usersController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Görev düzele"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormTextField(
                controller: taksNameTextEditingController,
                labelText: "Görev adı",
                validator: (value) => null),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                machines.isEmpty
                    ? const CircularProgressIndicator()
                    : DropdownButton(
                        hint: const Text("Makine"),
                        value: machineId,
                        items: [
                          for (MachineModel element in machines)
                            DropdownMenuItem(
                              value: element.id,
                              child: Text(element.name),
                            )
                        ],
                        onChanged: (value) {
                          setState(() {
                            machineId = value!;
                          });
                        },
                      ),
                SizedBox(
                  width: 50.w,
                ),
                machines.isEmpty
                    ? const CircularProgressIndicator()
                    : DropdownButton(
                        value: userId,
                        items: [
                          for (UserModel element in users)
                            DropdownMenuItem(
                              value: element.id,
                              child:
                                  Text("${element.name!} ${element.surname!}"),
                            )
                        ],
                        onChanged: (value) {
                          userId = value!;
                          setState(() {});
                        },
                      ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            OutlinedButton(
                onPressed: () {
                  showOmniDateTimePicker(
                    context: context,
                    is24HourMode: true,
                    isForce2Digits: true,
                  );
                },
                child: const Text("Tarih seç")),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Kaydet"))
          ],
        ),
      ),
    );
  }

  getItemsFromService() async {
    machines = await machinesController.getMachines();
    users = await usersController.getUsers();

    setState(() {});
  }
}
