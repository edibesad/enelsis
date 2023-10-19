import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/item_history_model.dart';

class StockHistoryViewModel extends BaseViewModel {
  RxList<ItemHistoryModel> history = RxList.empty();
  RxnInt sortColumnIndex = RxnInt();
  var isAscending = false.obs;
  var isLoading = false.obs;

  @override
  init() async {
    getItems();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  getItems() async {
    isLoading.value = true;
    final json = jsonDecode(await SimService().fetchItemHistory()) as List;
    history.value = json.map((e) => ItemHistoryModel.fromJson(e)).toList();
    isLoading.value = false;
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      history.sort((element1, element2) =>
          compareString(ascending, element1.item!.name!, element2.item!.name!));
    }
    if (columnIndex == 1) {
      history.sort((task1, task2) => compareString(
          ascending, task1.createdBy!.name!, task2.createdBy!.name!));
    }

    if (columnIndex == 2) {
      history.sort((element1, element2) =>
          compareDates(ascending, element1.createdAt!, element2.createdAt!));
    }
    if (columnIndex == 3) {
      history.sort((element1, element2) => ascending
          ? element1.quantity!.compareTo(element2.quantity!)
          : element2.quantity!.compareTo(element1.quantity!));
    }
    if (columnIndex == 4) {
      history.sort((element1, element2) =>
          compareString(ascending, element1.item!.unit!, element2.item!.unit!));
    }
    if (columnIndex == 5) {
      history.sort((element1, element2) => compareString(
          ascending, element1.description!, element2.description!));
    }
    if (columnIndex == 6) {
      history.sort((element1, element2) => ascending
          ? (element1.isSpent! ? 1 : 0).compareTo(element2.isSpent! ? 1 : 0)
          : (element2.isSpent! ? 1 : 0).compareTo(element1.isSpent! ? 1 : 0));
    }

    sortColumnIndex.value = columnIndex;
    isAscending.value = ascending;
  }

  compareString(bool ascending, String name, String name2) =>
      ascending ? name.compareTo(name2) : name2.compareTo(name);

  compareDates(bool ascending, DateTime? date, DateTime? date2) {
    if (date == null && date2 == null) return 0;
    if (date == null) return 1;
    if (date2 == null) return 1;
    return ascending ? date.compareTo(date2) : date2.compareTo(date);
  }
}
