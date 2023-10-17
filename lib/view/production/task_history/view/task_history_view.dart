import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/view/production/_model/machine_task_model.dart';
import 'package:enelsis/view/production/task_history/view_model/task_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskHistoryView extends StatelessWidget {
  const TaskHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TaskHistroyViewModel>(
      viewModel: TaskHistroyViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Obx(() {
        viewModel.overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;

        return viewModel.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                    onTapDown: viewModel.getPosition,
                    child: buildDataTable(viewModel, context),
                  ),
                ),
              );
      }),
    );
  }

  DataTable buildDataTable(
      TaskHistroyViewModel viewModel, BuildContext context) {
    return DataTable(
      sortAscending: viewModel.isAscending.value,
      sortColumnIndex: viewModel.sortColumnIndex.value,
      columnSpacing:
          ScreenUtil().orientation == Orientation.portrait ? 100.h : 100.w,
      columns: [
        buildDataColumn("İsim", viewModel),
        buildDataColumn("Operatör", viewModel),
        buildDataColumn("Makine", viewModel),
        buildDataColumn("Oluşturulma", viewModel),
        buildDataColumn("Görev türü", viewModel)
      ],
      rows: buildRows(viewModel, context),
    );
  }

  List<DataRow> buildRows(
      TaskHistroyViewModel viewModel, BuildContext context) {
    return generateRows(viewModel, context);
  }

  List<DataRow> generateRows(
      TaskHistroyViewModel viewModel, BuildContext context) {
    return viewModel.tasks
        .map<DataRow>((e) => buildDataRow(viewModel, context, e))
        .toList();
  }

  DataRow buildDataRow(TaskHistroyViewModel viewModel, BuildContext context,
      MachineTaskModel e) {
    return DataRow(
        onLongPress: viewModel.userViewModel.user.value!.isAdmin!
            ? () {
                showMenu(
                    context: context,
                    position: viewModel.relRectSize,
                    items: [
                      popupMenuEditItem(e),
                      popupMenuDeleteItem(context)
                    ]);
              }
            : null,
        cells: [
          buildDataCell(e.name ?? "-"),
          buildDataCell(e.name == null
              ? "-"
              : "${e.createdBy!.name!} ${e.createdBy!.surname!}"),
          buildDataCell(e.machine!.name),
          buildDataCell(
              "${e.createdAt!.day}/${e.createdAt!.month}/${e.createdAt!.year} ${e.createdAt!.hour}:${e.createdAt!.minute}"),
          buildDataCell(e.taskTypeModel!.name!)
        ]);
  }

  DataCell buildDataCell(String text) {
    return DataCell(
      Text(text),
    );
  }

  PopupMenuItem<dynamic> popupMenuDeleteItem(BuildContext context) {
    return PopupMenuItem(
      child: const Text("Sil"),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Uyarı!"),
                content:
                    const Text("Görevi silmek istediğinizden emin misiniz?"),
                actions: [
                  ElevatedButton(onPressed: () {}, child: const Text("Evet")),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Hayır"))
                ],
              );
            });
      },
    );
  }

  PopupMenuItem<dynamic> popupMenuEditItem(MachineTaskModel e) {
    return PopupMenuItem(
      child: const Text("Düzenle"),
      onTap: () {
        Get.toNamed("/edit_task", arguments: e);
      },
    );
  }

  DataColumn buildDataColumn(String label, TaskHistroyViewModel viewModel) {
    return DataColumn(
      onSort: viewModel.onSort,
      label: Text(label),
    );
  }
}
