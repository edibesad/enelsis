import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageStockViewModel extends BaseViewModel {
  RxList<ItemStockModel> stocks = RxList.empty();
  var isLoading = false.obs;

  @override
  void init() {
    getStocks();
  }

  @override
  void setContext(BuildContext context) {}

  navigateToEdit(ItemStockModel stock) {
    navigation.navigateToPage(
        path: NavigationConstants.EDIT_STOCK, data: stock);
  }

  getStocks() async {
    isLoading.value = true;
    BaseResponseModel<ItemStockModel> response = await networkManagerInstance
        .dioGet<ItemStockModel>("/stock", ItemStockModel());
    stocks.value = response.dataList!;
    isLoading.value = false;
  }
}
