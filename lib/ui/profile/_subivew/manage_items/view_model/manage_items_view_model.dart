import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/stock/stock_history/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageItemsViewModel extends BaseViewModel {
  var isItemsLoading = false.obs;
  RxList<ItemModel> items = RxList.empty();

  @override
  void init() {
    getItems();
  }

  @override
  void setContext(BuildContext context) {}

  getItems() async {
    isItemsLoading.value = true;
    BaseResponseModel<ItemModel> response =
        await networkManagerInstance.dioGet("/items", ItemModel());
    items.value = response.dataList!;
    isItemsLoading.value = true;
  }

  navigateToAdd() {
    Get.toNamed(NavigationConstants.ADD_ITEM);
  }
}
