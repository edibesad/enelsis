import 'package:enelsis/controller/department_controller.dart';
import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/core/components/text_fields/custom_form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final UserModel user = Get.arguments as UserModel;
  final DepartmentController departmentController =
      Get.put(DepartmentController());
  List<DepartmentModel> departments = [];
  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController surnameTextEditingController;
  late int depId;
  bool canEditUsers = true, canEditTasks = true;

  @override
  void initState() {
    super.initState();
    depId = user.department!.id!;
    departmentController.getDepartments().then((value) {
      setState(() {
        departments = value;
      });
    });

    nameTextEditingController = TextEditingController(text: user.name);
    surnameTextEditingController = TextEditingController(text: user.surname);
    userNameTextEditingController = TextEditingController(text: user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kullanıcı düzenle")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFormTextField(
                    controller: userNameTextEditingController,
                    labelText: "Kullanıcı adı",
                    validator: (value) => null),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormTextField(
                    controller: nameTextEditingController,
                    labelText: "İsim",
                    validator: (value) => null),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormTextField(
                    controller: surnameTextEditingController,
                    labelText: "Soyisim",
                    validator: (value) => null),
                SizedBox(
                  height: 20.h,
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
                CheckboxListTile(
                  title: const Text("Kullanıcıları düzenleyebilir"),
                  value: canEditUsers,
                  onChanged: (value) {
                    setState(() {
                      canEditUsers = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 20.w,
                ),
                CheckboxListTile(
                  title: const Text("Görevleri düzenleyebilir"),
                  value: canEditTasks,
                  onChanged: (value) {
                    setState(() {
                      canEditTasks = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Kaydet")),
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
                                    onPressed: () {},
                                    child: const Text("Evet")),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("İptal"))
                              ],
                              title: const Text("Uyarı!"),
                              content: const Text(
                                  "Kullanıyı silmek istediğinizden emin misiniz?")),
                        );
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Sil"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
