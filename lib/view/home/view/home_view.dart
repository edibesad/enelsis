import 'package:enelsis/view/home/model/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/view/base_view.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onPageBuild: (context, viewModel) => Scaffold(
        drawer: buildDrawer(viewModel),
        appBar: buildAppBar(viewModel),
        body: Obx(() => viewModel.activeView.value),
      ),
    );
  }

  buildAppBar(HomeViewModel viewModel) => AppBar(
        title: Obx(() => Text(viewModel.appBarTitle.value)),
      );

  buildDrawer(HomeViewModel viewModel) => Drawer(
        child: Column(
          children: [
            const ListTile(
              subtitle: Text("Üretim"),
            ),
            buildDrawerItem(viewModel.drawerItems[0], viewModel),
            buildDrawerItem(viewModel.drawerItems[1], viewModel),
            const Divider(),
            const ListTile(
              subtitle: Text("Elektronik"),
            ),
            buildDrawerItem(viewModel.drawerItems[2], viewModel),
            const Divider(),
            const ListTile(
              subtitle: Text("Stok"),
            ),
            buildDrawerItem(viewModel.drawerItems[3], viewModel),
            buildDrawerItem(viewModel.drawerItems[4], viewModel),
          ],
        ),
      );

  buildDrawerItem(DrawerItemModel item, HomeViewModel viewModel) => ListTile(
        leading: item.icon,
        title: Text(item.title!),
        onTap: () => viewModel.onDrawerItemTap(item),
      );
}
