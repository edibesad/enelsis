import 'dart:convert';

import 'package:enelsis/core/base/model/base_model.dart';

class BaseResponseModel<T extends BaseModel> {
  String? message;
  List<T>? dataList;
  int? totalLen;
  bool? result;

  BaseResponseModel({this.message, this.dataList, this.totalLen, this.result});

  BaseResponseModel.fromJson(Map<String, dynamic> json, {BaseModel? model}) {
    message = json['message'];
    if (json['dataList'] != null) {
      dataList = [];
      if (model != null) {
        json['dataList'].forEach((v) {
          dataList!.add(model.fromJson(v));
        });
      }
    }
    totalLen = json['totalLen'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (dataList != null) {
      data['dataList'] = jsonEncode(dataList);
    }
    data['totalLen'] = totalLen;
    data['result'] = result;
    return data;
  }
}
