import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/profile/_subivew/manage_stock/view_model/manage_stock_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ManageStockView extends StatelessWidget {
  const ManageStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ManageStockViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(viewModel),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar(ManageStockViewModel viewModel) => AppBar(
        actions: const [
          // IconButton(
          //     onPressed: viewModel.navigateToAdd, icon: const Icon(Icons.add))
        ],
      );

  buildBody(ManageStockViewModel viewModel) =>
      Obx(() => viewModel.isLoading.value
          ? const LoadingWidget()
          : viewModel.stocks.isEmpty
              ? const Center(
                  child: Text("Ürün bulunamadı"),
                )
              : buildListView(viewModel));

  buildListView(ManageStockViewModel viewModel) => ListView.builder(
        itemCount: viewModel.stocks.length,
        itemBuilder: (context, index) => buildListCard(viewModel, index),
      );

  ListTile buildListCard(ManageStockViewModel viewModel, int index) {
    return ListTile(
      title: Text(viewModel.stocks[index].item!.name!),
      trailing: IconButton(
          onPressed: () => viewModel.navigateToEdit(viewModel.stocks[index]),
          icon: const Icon(Icons.edit)),
    );
  }
}
