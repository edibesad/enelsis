import 'package:enelsis/ui/stock/stock_history/model/item_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockHistoryTable extends StatefulWidget {
  const StockHistoryTable(this.history, {super.key});
  final List<ItemHistoryModel> history;

  @override
  State<StockHistoryTable> createState() => _StockHistoryTableState();
}

class _StockHistoryTableState extends State<StockHistoryTable> {
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
            sortAscending: isAscending,
            sortColumnIndex: sortColumnIndex,
            columnSpacing:
                ScreenUtil().orientation == Orientation.portrait ? 100.h : 45.w,
            columns: [
              buildDataColumn("Malzeme ismi"),
              buildDataColumn("Ekleyen kişi"),
              buildDataColumn("Tarih"),
              buildDataColumn("Miktar"),
              buildDataColumn("Birim"),
              buildDataColumn("Açıklama"),
              buildDataColumn("Kullanma")
            ],
            rows: widget.history
                .map<DataRow>((e) => DataRow(cells: [
                      DataCell(Text("${e.item!.name}")),
                      DataCell(Text(
                          "${e.createdBy!.name} ${e.createdBy!.surname!}")),
                      DataCell(Text(
                          "${e.createdAt!.day}/${e.createdAt!.month}/${e.createdAt!.year} ${e.createdAt!.hour}:${e.createdAt!.minute < 10 ? "0${e.createdAt!.minute}" : e.createdAt!.minute}")),
                      DataCell(Text("${e.quantity}")),
                      DataCell(Text(e.item!.unit!)),
                      DataCell(Text("${e.description}")),
                      DataCell(Text(e.isSpent! ? "Evet" : "Hayır"))
                    ]))
                .toList()),
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
      widget.history.sort((element1, element2) =>
          compareString(ascending, element1.item!.name!, element2.item!.name!));
    }
    if (columnIndex == 1) {
      widget.history.sort((task1, task2) => compareString(
          ascending, task1.createdBy!.name!, task2.createdBy!.name!));
    }

    if (columnIndex == 2) {
      widget.history.sort((element1, element2) =>
          compareDates(ascending, element1.createdAt!, element2.createdAt!));
    }
    if (columnIndex == 3) {
      widget.history.sort((element1, element2) => ascending
          ? element1.quantity!.compareTo(element2.quantity!)
          : element2.quantity!.compareTo(element1.quantity!));
    }
    if (columnIndex == 4) {
      widget.history.sort((element1, element2) =>
          compareString(ascending, element1.item!.unit!, element2.item!.unit!));
    }
    if (columnIndex == 5) {
      widget.history.sort((element1, element2) => compareString(
          ascending, element1.description!, element2.description!));
    }
    if (columnIndex == 6) {
      widget.history.sort((element1, element2) => ascending
          ? (element1.isSpent! ? 1 : 0).compareTo(element2.isSpent! ? 1 : 0)
          : (element2.isSpent! ? 1 : 0).compareTo(element1.isSpent! ? 1 : 0));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
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
