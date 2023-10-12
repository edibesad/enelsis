import 'package:enelsis/controller/item_controller.dart';
import 'package:enelsis/models/item_history_model.dart';
import 'package:enelsis/views/stocks_page/stocks_history/widgets/stock_history_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StocksHistory extends StatelessWidget {
  const StocksHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var itemController = Get.put(ItemController());
    return FutureBuilder<List<ItemHistoryModel>>(
      future: itemController.getItemHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Hata! : ${snapshot.error}"),
          );
        }
        return StockHistoryTable(snapshot.data!);
      },
    );
  }
}
