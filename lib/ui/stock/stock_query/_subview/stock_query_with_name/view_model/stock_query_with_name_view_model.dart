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

  RxList<ItemStockModel> items = RxList.empty();
  onSubmitted(String query) async {
    isLoading.value = true;
    BaseResponseModel<ItemStockModel> response = await networkManagerInstance
        .dioGet<ItemStockModel>("/stock/", ItemStockModel(),
            queryParameters: {"key": query});
    items.value = response.dataList!;
    isLoading.value = false;
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
