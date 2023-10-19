import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onFormButtonPress() {
    navigation.navigateToPageClear(path: NavigationConstants.HOME);
  }

  @override
  void init() {
    //Login service tanımı
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
}
