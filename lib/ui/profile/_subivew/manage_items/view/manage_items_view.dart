import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/view_model/manage_items_view_model.dart';
import 'package:enelsis/ui/stock/stock_history/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageItemsView extends StatelessWidget {
  const ManageItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ManageItemsViewModel(),
      onModelReady: (model) {
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(viewModel),
        body: buildItemListView(viewModel),
      ),
    );
  }

  buildAppBar(ManageItemsViewModel viewModel) => AppBar(
        actions: [
          IconButton(
              onPressed: viewModel.navigateToAdd, icon: const Icon(Icons.add))
        ],
      );

  buildItemListView(ManageItemsViewModel viewModel) =>
      Obx(() => ListView.builder(
          itemCount: viewModel.items.length,
          itemBuilder: (context, index) =>
              buildListViewElement(viewModel.items[index])));

  buildListViewElement(ItemModel item) => Card(
          child: ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Get.toNamed(NavigationConstants.EDIT_ITEM, arguments: item);
          },
        ),
        title: Text(item.name!),
      ));
}
