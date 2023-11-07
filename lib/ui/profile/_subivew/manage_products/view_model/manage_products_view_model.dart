import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class ManageProductsViewModel extends BaseViewModel {
  @override
  void init() {
    getProducts();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  RxList<ProductModel> products = RxList<ProductModel>.empty();

  var isLoading = false.obs;

  navigateToEdit(ProductModel product) {
    navigation.navigateToPage(
        path: NavigationConstants.EDIT_PRODUCT, data: product);
  }

  getProducts() async {
    isLoading.value = true;
    BaseResponseModel<ProductModel> response = await networkManagerInstance
        .dioGet<ProductModel>("/products", ProductModel());
    products.value = response.dataList!;
    isLoading.value = false;
  }
}
