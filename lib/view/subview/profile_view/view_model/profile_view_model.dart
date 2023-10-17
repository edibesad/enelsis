import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';

class ProfileViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void onLogoutPress() {
    navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
  }

  void onTap(String path) {
    navigation.navigateToPage(path: path);
  }
}
