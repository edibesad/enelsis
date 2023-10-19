import 'dart:async';
import 'dart:convert';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockQueryWithNameViewModel extends BaseViewModel {
  TextEditingController textEditingController = TextEditingController();
  Timer? _debounce;
  var isLoading = false.obs;
  String query = "";

  RxList<ItemModel> items = RxList.empty();

  onSearchChanged(String query) {
    isLoading.value = true;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      isLoading.value = false;
      this.query = query;
      final json =
          jsonDecode(await SimService().fetchItemByName(query)) as List;
      items.value = json.map((e) => ItemModel.fromJson(e)).toList();
    });
  }

  @override
  void init() {}

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
}
