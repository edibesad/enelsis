import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/stock/stock_history/model/item_history_model.dart';
import 'package:enelsis/ui/stock/stock_history/view_model/stock_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StockHistoryView extends StatelessWidget {
  const StockHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StockHistoryViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      viewModel: StockHistoryViewModel(),
      onPageBuild: (context, viewModel) => Obx(() => viewModel.isLoading.value
          ? const LoadingWidget()
          : buildDataTable(viewModel)),
    );
  }

  buildDataTable(StockHistoryViewModel viewModel) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            sortAscending: viewModel.isAscending.value,
            sortColumnIndex: viewModel.sortColumnIndex.value,
            columnSpacing:
                ScreenUtil().orientation == Orientation.portrait ? 100.h : 45.w,
            columns: [
              buildDataColumn("Malzeme ismi", viewModel),
              buildDataColumn("Ekleyen kişi", viewModel),
              buildDataColumn("Tarih", viewModel),
              buildDataColumn("Miktar", viewModel),
              buildDataColumn("Birim", viewModel),
              buildDataColumn("Açıklama", viewModel),
              buildDataColumn("Kullanma", viewModel)
            ],
            rows: viewModel.history
                .map<DataRow>((e) => buildDataRow(e))
                .toList()),
      ),
    );
  }

  DataRow buildDataRow(ItemHistoryModel e) {
    return DataRow(cells: [
      DataCell(Text("${e.item!.name}")),
      DataCell(Text("${e.createdBy!.name} ${e.createdBy!.surname!}")),
      DataCell(Text(
          "${e.createdAt!.day}/${e.createdAt!.month}/${e.createdAt!.year} ${e.createdAt!.hour}:${e.createdAt!.minute < 10 ? "0${e.createdAt!.minute}" : e.createdAt!.minute}")),
      DataCell(Text("${e.quantity}")),
      DataCell(Text(e.item!.unit!)),
      DataCell(Text("${e.description}")),
      DataCell(Text(e.isSpent! ? "Evet" : "Hayır"))
    ]);
  }

  DataColumn buildDataColumn(
    String label,
    StockHistoryViewModel viewModel,
  ) {
    return DataColumn(
      onSort: viewModel.onSort,
      label: Text(label),
    );
  }
}
