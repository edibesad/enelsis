import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  Rxn<UserModel> user = Rxn<UserModel>(UserModel(isAdmin: true));
}
