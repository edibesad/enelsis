import 'dart:convert';

import 'package:enelsis/core/base/model/base_model.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel extends BaseModel {
  int? id;
  String? name;

  ProductModel({
    this.id,
    this.name,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  fromJson(Map<String, dynamic> json) => ProductModel.fromJson(json);
}
