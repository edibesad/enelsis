import 'package:enelsis/core/base/model/base_model.dart';
import 'package:flutter/material.dart';

class DrawerItemModel extends BaseModel {
  String? title;
  Icon? icon;
  Widget? view;
  bool isActive = false;
  DrawerItemModel({this.icon, this.title, this.view});

  @override
  fromJson(Map<String, Object?> json) {}

  @override
  Map<String, Object?> toJson() {
    throw UnimplementedError();
  }
}
