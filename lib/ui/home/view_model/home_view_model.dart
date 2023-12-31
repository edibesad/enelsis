import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/components/cards/welcome_card.dart';
import 'package:enelsis/ui/electronic/view/electronic_view.dart';
import 'package:enelsis/ui/home/model/drawer_item_model.dart';
import 'package:enelsis/ui/production/machines/view/production_machines_view.dart';
import 'package:enelsis/ui/production/task_history/view/task_history_view.dart';
import 'package:enelsis/ui/stock/stock_history/view/stock_history_view.dart';
import 'package:enelsis/ui/stock/stock_query/view/stock_query_view.dart';
import 'package:enelsis/ui/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends BaseViewModel {
  Rx<Widget> activeView = Rx<Widget>(const WelcomeCard());
  var appBarTitle = "Hoşgeldiniz!".obs;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  onDrawerItemTap(DrawerItemModel e) {
    for (var element in drawerItems) {
      if (element.isActive) element.isActive = false;
      e.isActive = true;
      Get.back();
      changeActiveView(e.view!);
      changeAppBarTitle(e.title!);
      return;
    }
  }

  changeAppBarTitle(String appBarTitle) {
    this.appBarTitle.value = appBarTitle;
  }

  changeActiveView(Widget activeView) {
    this.activeView.value = activeView;
  }

  onDetailsPressed() {
    for (var element in drawerItems) {
      if (element.isActive) element.isActive = false;
      Get.back();
      changeActiveView(const ProfileView());
      changeAppBarTitle("Profil");
      return;
    }
  }

  List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
        icon: const Icon(Icons.precision_manufacturing),
        title: "Makineler",
        view: const ProductionMachinesView()),
    DrawerItemModel(
        icon: const Icon(Icons.history),
        title: "Görev Geçmişi",
        view: const TaskHistoryView()),
    DrawerItemModel(
        icon: const Icon(Icons.precision_manufacturing),
        title: "Makinler",
        view: const ElectronicView()),
    DrawerItemModel(
        icon: const Icon(Icons.search),
        title: "Stok Sorgula",
        view: const StocksQueryView()),
    DrawerItemModel(
        icon: const Icon(Icons.history),
        title: "Stok Geçmişi",
        view: const StockHistoryView()),
  ];
}
