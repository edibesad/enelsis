import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/components/cards/welcome_card.dart';
import 'package:enelsis/view/home/model/drawer_item_model.dart';
import 'package:enelsis/view/home/subfeatures/production/machines/view/production_machines_view.dart';
import 'package:enelsis/views/machines_electonic_page/machines_electronic_page.dart';
import 'package:enelsis/view/home/subfeatures/profile/view/profile_view.dart';
import 'package:enelsis/views/stocks_page/stocks_history/stocks_history.dart';
import 'package:enelsis/views/stocks_page/stocks_query/stocks_query.dart';
import 'package:enelsis/views/tasks_page/tasks_page.dart';
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

  //TODO pageler değiştirilecek
  List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
        icon: const Icon(Icons.precision_manufacturing),
        title: "Makineler",
        view: const ProductionMachinesView()),
    DrawerItemModel(
        icon: const Icon(Icons.history),
        title: "Görev Geçmişi",
        view: const TasksPage()),
    DrawerItemModel(
        icon: const Icon(Icons.precision_manufacturing),
        title: "Makinler",
        view: MachinesElectronicPage()),
    DrawerItemModel(
        icon: const Icon(Icons.search),
        title: "Stok Sorgula",
        view: const StocksQuery()),
    DrawerItemModel(
        icon: const Icon(Icons.history),
        title: "Stok Geçmişi",
        view: const StocksHistory()),
  ];
}
