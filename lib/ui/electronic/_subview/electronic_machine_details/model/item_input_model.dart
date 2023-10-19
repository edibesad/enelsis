import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/model/input_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';

class ProductInputModel extends BaseModel {
  InputModel input;
  ProductModel product;

  ProductInputModel({required this.input, required this.product});

  factory ProductInputModel.fromJson(Map<String, dynamic> json) =>
      ProductInputModel(
          input: InputModel.fromJson(json["machine_input"]),
          product: ProductModel.fromJson(json["item"]));

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, Object?> toJson() {
    throw UnimplementedError();
  }
}
