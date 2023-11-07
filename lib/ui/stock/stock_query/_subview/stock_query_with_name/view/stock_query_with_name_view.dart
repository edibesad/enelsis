import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/stock/stock_query/_subview/stock_query_with_name/view_model/stock_query_with_name_view_model.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StockQueryWithNameView extends StatelessWidget {
  const StockQueryWithNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StockQueryWithNameViewModel>(
      viewModel: StockQueryWithNameViewModel(),
      onModelReady: (model) {},
      onPageBuild: (context, viewModel) => Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 400.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: Color(Colors.black.withOpacity(.15).value),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: buildTextField(viewModel),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(() => viewModel.isLoading.value
              ? const CircularProgressIndicator()
              : Expanded(child: buildQueryResults(viewModel)))
        ],
      ),
    );
  }

  TextField buildTextField(StockQueryWithNameViewModel viewModel) {
    return TextField(
      onChanged: viewModel.onSearchChanged,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          labelText: "Ürün adı",
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.auto),
    );
  }

  buildQueryResults(StockQueryWithNameViewModel viewModel) => ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) => Card(
            child: ListTile(
          title: Text(viewModel.items[index].item!.name!),
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
                            child: buildItemDetail(viewModel.items[index])),
                      ),
                    ));
          },
        )),
      );

  buildItemDetail(ItemStockModel stock) => Column(
        children: [
          Expanded(
            child: ListTile(
              title: const Text("Malzeme Adı"),
              subtitle: Text(stock.item!.name ?? "Bulunamadı"),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListTile(
              title: const Text("Stok adedi"),
              subtitle: Text(stock.quantity == null
                  ? "Bulunamadı"
                  : stock.quantity.toString()),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("Birimi"),
            subtitle: Text(stock.item!.unit ?? "Bulunamadı"),
          )
        ],
      );
}
