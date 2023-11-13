import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageUsersViewModel extends BaseViewModel {
  var isLoading = false.obs;

  RxList<UserModel> users = RxList.empty();

  @override
  void init() {
    getUsers();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  getUsers() async {
    isLoading.value = true;
    //TODO: DOLDUR
    isLoading.value = false;
  }

  navigateUserEdit(UserModel user) {
    navigation.navigateToPage(path: NavigationConstants.EDIT_USER, data: user);
  }
}
