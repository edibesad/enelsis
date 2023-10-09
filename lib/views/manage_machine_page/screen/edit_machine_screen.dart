import 'package:enelsis/controller/department_controller.dart';
import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/utils/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditMachineScreen extends StatefulWidget {
  const EditMachineScreen({super.key});

  @override
  State<EditMachineScreen> createState() => _EditMachineScreenState();
}

class _EditMachineScreenState extends State<EditMachineScreen> {
  late MachineModel machine;
  TextEditingController nameTextEditingController = TextEditingController();
  final DepartmentController departmentController =
      Get.put(DepartmentController());
  List<DepartmentModel> departments = [];
  late int depId, typeId = 1;

  @override
  void initState() {
    super.initState();
    machine = Get.arguments;
    depId = machine.department.id!;
    nameTextEditingController.text = machine.name;
    departmentController.getDepartments().then((value) {
      setState(() {
        departments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Makine düzenle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidgets.generateTextField(
                TextEditingController(), "İsim", (value) => null),
            SizedBox(
              height: 10.h,
            ),
            departments.isEmpty
                ? const CircularProgressIndicator()
                : DropdownButton(
                    value: depId,
                    items: [
                      for (DepartmentModel element in departments)
                        DropdownMenuItem(
                          value: element.id,
                          child: Text(element.name!),
                        )
                    ],
                    onChanged: (value) {
                      depId = value!;
                      setState(() {});
                    },
                  ),
            SizedBox(
              height: 10.h,
            ),
            DropdownButton(
              value: typeId,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Cnc makinesi"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Dizgi makinesi"),
                )
              ],
              onChanged: (value) {
                typeId = value!;
                setState(() {});
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Kaydet")),
                SizedBox(
                  width: 50.w,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          actions: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Evet")),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("İptal"))
                          ],
                          title: const Text("Uyarı!"),
                          content: const Text(
                              "Kullanıyı silmek istediğinizden emin misiniz?")),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Sil"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
