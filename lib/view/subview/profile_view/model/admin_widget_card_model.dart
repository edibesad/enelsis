import 'package:enelsis/core/base/model/base_model.dart';
import 'package:flutter/material.dart';

class AdminWidgetCardModel extends BaseModel {
  Icon icon;
  String title;
  String path;
  AdminWidgetCardModel(
      {required this.icon, required this.path, required this.title});

  @override
  fromJson(Map<String, Object?> json) {}

  @override
  Map<String, Object?> toJson() {
    throw UnimplementedError();
  }
}
