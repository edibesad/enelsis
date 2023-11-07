import 'dart:async';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/base/model/base_response_model.dart';

class StockQueryWithNameViewModel extends BaseViewModel {
  TextEditingController textEditingController = TextEditingController();
  Timer? _debounce;
  var isLoading = false.obs;
  String query = "";

  RxList<ItemStockModel> items = RxList.empty();
  onSearchChanged(String query) {
    isLoading.value = true;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      isLoading.value = false;
      this.query = query;
      BaseResponseModel<ItemStockModel> response = await networkManagerInstance
          .dioGet<ItemStockModel>("/items/history", ItemStockModel(),
              queryParameters: {"key": query});
      items.value = response.dataList!;
    });
  }

  @override
  Future<void> init() async {
    BaseResponseModel<ItemStockModel> response =
        await networkManagerInstance.dioGet<ItemStockModel>(
      "/stock",
      ItemStockModel(),
    );
    items.value = response.dataList!;
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
}
