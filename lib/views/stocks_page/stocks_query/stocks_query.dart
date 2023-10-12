import 'package:enelsis/views/stocks_page/stocks_query/widgets/query_with_name.dart';
import 'package:enelsis/views/stocks_page/stocks_query/widgets/query_with_qr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StocksQuery extends StatelessWidget {
  const StocksQuery({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
              child: TabBarView(children: [QueryWithQR(), QueryWithName()]))
        ],
      ),
    );
  }
}
