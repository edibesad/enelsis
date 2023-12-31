import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/view_model/manage_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageProductsView extends StatelessWidget {
  const ManageProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ManageProductsViewModel(),
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

  buildAppBar(ManageProductsViewModel viewModel) => AppBar(
        actions: [
          IconButton(
              onPressed: viewModel.navigateToAdd, icon: const Icon(Icons.add))
        ],
      );

  buildBody(ManageProductsViewModel viewModel) =>
      Obx(() => viewModel.isLoading.value
          ? const LoadingWidget()
          : viewModel.products.isEmpty
              ? const Center(
                  child: Text("Ürün bulunamadı"),
                )
              : buildListView(viewModel));

  buildListView(ManageProductsViewModel viewModel) => ListView.builder(
        itemCount: viewModel.products.length,
        itemBuilder: (context, index) => buildListCard(viewModel, index),
      );

  ListTile buildListCard(ManageProductsViewModel viewModel, int index) {
    return ListTile(
      title: Text(viewModel.products[index].name!),
      trailing: IconButton(
          onPressed: () => viewModel.navigateToEdit(viewModel.products[index]),
          icon: const Icon(Icons.edit)),
    );
  }
}
