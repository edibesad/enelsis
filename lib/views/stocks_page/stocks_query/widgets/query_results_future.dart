import 'package:enelsis/controller/item_controller.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_model.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/views/stocks_page/stocks_query/widgets/item_detail_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QueryResultsFuture extends StatelessWidget {
  QueryResultsFuture(this.query, {super.key});
  final String query;
  final itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: itemController.getItemByName(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        } else if (snapshot.hasError) {
          return Text("Hata : ${snapshot.error}");
        } else if (snapshot.data!.isEmpty) {
          return const Center(child: Text("Malzeme bulunamadı"));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Card(
                child: ListTile(
              title: Text(snapshot.data![index].name!),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SizedBox(
                    child: AlertDialog(
                        actions: [
                          ElevatedButton(
                              onPressed: () => Get.back(),
                              child: const Text("Tamam"))
                        ],
                        content: SizedBox(
                            height: 250.h,
                            width: 100.w,
                            child: ItemDetailFuture(
                                id: snapshot.data![index].id))),
                  ),
                );
              },
            )),
          );
        }
      },
    );
  }
}
