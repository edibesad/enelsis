import 'package:enelsis/core/init/network/network_manager.dart';
import 'package:enelsis/product/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../ui/production/_model/machine_task_model.dart';

class TaskHistoryDataTable extends StatefulWidget {
  const TaskHistoryDataTable(this.tasks, {super.key});
  final List<MachineTaskModel> tasks;
  @override
  State<TaskHistoryDataTable> createState() => _TaskHistoryDataTableState();
}

class _TaskHistoryDataTableState extends State<TaskHistoryDataTable> {
  var userViewModel = Get.put(UserViewModel());
  bool isAscending = false;
  int? sortColumnIndex;
  late Offset tapXY;
  late RenderBox? overlay;
  @override
  Widget build(BuildContext context) {
    overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    return GestureDetector(
      onTapDown: (details) {
        tapXY = details.globalPosition;
      },
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortAscending: isAscending,
            sortColumnIndex: sortColumnIndex,
            columnSpacing: ScreenUtil().orientation == Orientation.portrait
                ? 100.h
                : 100.w,
            columns: [
              buildDataColumn("İsim"),
              buildDataColumn("Operatör"),
              buildDataColumn("Makine"),
              buildDataColumn("Oluşturulma"),
              buildDataColumn("Görev türü")
            ],
            rows: buildRows(context),
          ),
        ),
      ),
    );
  }

  List<DataRow> buildRows(BuildContext context) {
    return generateRows(context);
  }

  DataColumn buildDataColumn(String label) {
    return DataColumn(
      onSort: onSort,
      label: Text(label),
    );
  }

  List<DataRow> generateRows(BuildContext context) {
    return widget.tasks.map<DataRow>((e) => buildDataRow(context, e)).toList();
  }

  DataRow buildDataRow(BuildContext context, MachineTaskModel e) {
    return DataRow(
        onLongPress: userViewModel.user.value!.isAdmin!
            ? () {
                showMenu(context: context, position: relRectSize, items: [
                  popupMenuEditItem(e),
                  popupMenuDeleteItem(context, e)
                ]);
              }
            : null,
        cells: [
          buildDataCell(e.description ?? "-"),
          buildDataCell(e.description == null
              ? "-"
              : "${e.createdBy!.name!} ${e.createdBy!.surname!}"),
          buildDataCell(e.machine!.name!),
          buildDataCell(
              "${e.createdAt!.day}/${e.createdAt!.month}/${e.createdAt!.year} ${e.createdAt!.hour}:${e.createdAt!.minute}"),
          buildDataCell(e.taskTypeModel!.name!)
        ]);
  }

  PopupMenuItem<dynamic> popupMenuDeleteItem(
      BuildContext context, MachineTaskModel machineTaskModel) {
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
                  ElevatedButton(
                      onPressed: () {
                        NetworkManager.instance!.dioDelete(
                          "/machine_tasks/delete/${machineTaskModel.id}",
                        );

                        Get.back();
                      },
                      child: const Text("Evet")),
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

  DataCell buildDataCell(String text) {
    return DataCell(
      Text(text),
    );
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      widget.tasks.sort((task1, task2) =>
          compareString(ascending, task1.description!, task2.description!));
    }
    if (columnIndex == 1) {
      widget.tasks.sort((task1, task2) => compareString(
          ascending, task1.createdBy!.name!, task2.createdBy!.name!));
    }

    if (columnIndex == 2) {
      widget.tasks.sort((task1, task2) =>
          compareDates(ascending, task1.createdAt!, task2.createdAt!));
    }
    if (columnIndex == 3) {
      widget.tasks.sort((task1, task2) => compareString(
          ascending, task1.taskTypeModel!.name!, task2.taskTypeModel!.name!));
    }
    sortColumnIndex = columnIndex;
    isAscending = ascending;
  }

  compareString(bool ascending, String name, String name2) =>
      ascending ? name.compareTo(name2) : name2.compareTo(name);

  compareDates(bool ascending, DateTime? date, DateTime? date2) {
    if (date == null && date2 == null) return 0;
    if (date == null) return 1;
    if (date2 == null) return 1;
    return ascending ? date.compareTo(date2) : date2.compareTo(date);
  }

  PopupMenuItem<dynamic> popupMenuEditItem(MachineTaskModel e) {
    return PopupMenuItem(
      child: const Text("Düzenle"),
      onTap: () {
        Get.toNamed("/edit_task", arguments: e);
      },
    );
  }

  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY & const Size(40, 40), overlay!.size);
}
