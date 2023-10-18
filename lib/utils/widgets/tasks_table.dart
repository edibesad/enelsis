import 'package:enelsis/ui/production/_model/machine_task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TasksTable extends StatefulWidget {
  const TasksTable(this.tasks, this.admin, {super.key});
  final List<MachineTaskModel> tasks;
  final bool admin;

  @override
  State<TasksTable> createState() => _TasksTableState();
}

class _TasksTableState extends State<TasksTable> {
  late Offset tapXY;
  late RenderBox? overlay;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GestureDetector(
          onTapDown: getPosition,
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
            rows: widget.tasks
                .map<DataRow>((e) => DataRow(
                        onLongPress: widget.admin
                            ? () {
                                showMenu(
                                    context: context,
                                    position: relRectSize,
                                    items: [
                                      PopupMenuItem(
                                        child: const Text("Düzenle"),
                                        onTap: () {
                                          Get.toNamed("/edit_task",
                                              arguments: e);
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: const Text("Sil"),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text("Uyarı!"),
                                                  content: const Text(
                                                      "Görevi silmek istediğinizden emin misiniz?"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text("Evet")),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child:
                                                            const Text("Hayır"))
                                                  ],
                                                );
                                              });
                                        },
                                      )
                                    ]);
                              }
                            : null,
                        cells: [
                          DataCell(
                            Text(e.name ?? "-"),
                          ),
                          DataCell(
                            Text(e.name == null
                                ? "-"
                                : "${e.createdBy!.name!} ${e.createdBy!.surname!}"),
                          ),
                          DataCell(Text(
                              "${e.createdAt!.day}/${e.createdAt!.month}/${e.createdAt!.year} ${e.createdAt!.hour}:${e.createdAt!.minute}")),
                          DataCell(Text(e.taskTypeModel!.name!))
                        ]))
                .toList(),
          ),
        ),
      ),
    );
  }

  DataColumn buildDataColumn(String label) {
    return DataColumn(
      onSort: onSort,
      label: Text(label),
    );
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      widget.tasks.sort(
          (task1, task2) => compareString(ascending, task1.name!, task2.name!));
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

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY & const Size(40, 40), overlay!.size);

  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }

  compareString(bool ascending, String name, String name2) =>
      ascending ? name.compareTo(name2) : name2.compareTo(name);

  compareDates(bool ascending, DateTime? date, DateTime? date2) {
    if (date == null && date2 == null) return 0;
    if (date == null) return 1;
    if (date2 == null) return 1;
    return ascending ? date.compareTo(date2) : date2.compareTo(date);
  }
}
