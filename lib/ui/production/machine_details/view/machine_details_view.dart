import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/product/widget/task_history_data_table.dart';
import 'package:enelsis/ui/production/machine_details/view_model/machine_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MachineDetailsView extends StatelessWidget {
  const MachineDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MachineDetailsViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      viewModel: MachineDetailsViewModel(),
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(viewModel),
        body: viewModel.machine.value == null
            ? const LoadingWidget()
            : buildBody(viewModel),
      ),
    );
  }

  SingleChildScrollView buildBody(MachineDetailsViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 20.h),
        buildTitleText("Makine Bilgileri"),
        SizedBox(height: 20.h),
        buildMachineInfo(viewModel),
        SizedBox(height: 20.h),
        buildTitleText("Makine Son İşlem"),
        SizedBox(height: 20.h),
        buildTaskInfo(viewModel),
        SizedBox(height: 20.h),
        buildTitleText("Makine Geçmişi"),
        SizedBox(height: 20.h),
        buildMachineTaskHistory(viewModel),
        SizedBox(height: 20.h),
      ]),
    );
  }

  Text buildTitleText(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.r),
    );
  }

  AppBar buildAppBar(MachineDetailsViewModel viewModel) {
    return AppBar(title: Text("${viewModel.machine.value?.name}"), actions: [
      IconButton(
          onPressed: () {
            viewModel.showAddTaskDialog();
          },
          icon: const Icon(Icons.add))
    ]);
  }

  //Makine hakkındaki bilgileri görünütleyen widget

  buildMachineInfo(MachineDetailsViewModel viewModel) => Obx(() => Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.title),
              title: const Text("Makine ismi"),
              subtitle: Text(viewModel.machine.value!.name!),
            ),
          ),
          Obx(
            () => Card(
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  color: generateColorByStatus(
                      viewModel.machine.value!.task != null
                          ? viewModel.machine.value!.task!.status
                          : null),
                ),
                title: const Text("Durum"),
                subtitle: Text(viewModel.machine.value!.task == null
                    ? "Hiç görev eklenmemiş"
                    : viewModel.machine.value!.task!.status == null
                        ? "Çalışmıyor"
                        : (viewModel
                            .machine.value!.task!.taskTypeModel!.name!)),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.precision_manufacturing),
              title: const Text("Makine Tipi"),
              subtitle: Text(viewModel.machine.value!.type!.name!),
            ),
          ),
        ],
      ));
  //Makinenin statusuna göre renk generate ediliyor
  MaterialColor generateColorByStatus(bool? status) {
    switch (status) {
      case null:
        return Colors.red;
      case false:
        return Colors.amber;
      case true:
        return Colors.green;
    }
  }

  //Makinenin son taskinin bilgileri

  buildTaskInfo(MachineDetailsViewModel viewModel) => Obx(() => Column(
        children: [
          Column(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.task),
                  title: const Text("Görev ismi"),
                  subtitle: Text(viewModel.machine.value!.task != null
                      ? viewModel.machine.value!.task!.description!
                      : ""),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text("Açıklama"),
                  subtitle: Text(viewModel.machine.value!.task != null
                      ? viewModel.machine.value!.task!.description!
                      : "-"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.engineering),
                  title: const Text("Operatör"),
                  subtitle: Text(viewModel.machine.value!.task != null
                      ? "${viewModel.machine.value!.task!.createdBy!.name} ${viewModel.machine.value!.task!.createdBy!.surname}"
                      : ""),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.date_range),
                  title: const Text("Başlama tarihi"),
                  subtitle: Text(viewModel.machine.value!.task != null
                      ? generateDateString(
                          viewModel.machine.value!.task!.createdAt!)
                      : ""),
                ),
              ),
              viewModel.machine.value!.task != null
                  ? (viewModel.machine.value!.task!.createdAt!
                                  .difference(DateTime.now()))
                              .inHours
                              .abs() >
                          2
                      ? Card(
                          child: ListTile(
                            onTap: () {
                              viewModel.showAddTaskDialog();
                            },
                            leading: const Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            title: Text(
                                "Makineye atanılan son işlemin ardından ${viewModel.machine.value!.task!.createdAt!.difference(DateTime.now()).inHours.abs()} saat geçti"),
                            subtitle:
                                const Text("Yeni işlem eklemek için tıklayın"),
                          ),
                        )
                      : const SizedBox()
                  : Card(
                      child: ListTile(
                        onTap: () {
                          viewModel.showAddTaskDialog();
                        },
                        leading: const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                        title: const Text("Makineye hiç işlem atanmamış"),
                        subtitle:
                            const Text("Yeni işlem eklemek için tıklayın"),
                      ),
                    )
            ],
          ),
        ],
      ));

  buildMachineTaskHistory(MachineDetailsViewModel viewModel) => Obx(
        () => viewModel.isLoading.value
            ? const LoadingWidget()
            : TaskHistoryDataTable(viewModel.tasks),
      );

  String generateDateString(DateTime dateTime) =>
      "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
}
