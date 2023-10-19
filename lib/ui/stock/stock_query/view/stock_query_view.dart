import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/stock/stock_query/_subview/stock_query_with_name/view/stock_query_with_name_view.dart';
import 'package:enelsis/ui/stock/stock_query/_subview/stock_query_with_qr/view/stock_query_with_qr_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/stock_query_view_model.dart';

class StocksQueryView extends StatelessWidget {
  const StocksQueryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StockQueryViewModel>(
      viewModel: StockQueryViewModel(),
      onPageBuild: (context, viewModel) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(
                  child: Text("QR ile sorgu"),
                ),
                Tab(
                  child: Text("İsim ile sorgu"),
                )
              ],
              labelColor: Get.theme.primaryColor,
              dividerColor: Colors.black,
              indicatorColor: Get.theme.primaryColor,
            ),
            const Expanded(
                child: TabBarView(children: [
              StockQueryWithQrView(),
              StockQueryWithNameView()
            ]))
          ],
        ),
      ),
    );
  }
}
