import 'package:enelsis/models/input_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';

class ProductInputModel {
  InputModel input;
  ProductModel product;

  ProductInputModel({required this.input, required this.product});

  factory ProductInputModel.fromJson(Map<String, dynamic> json) =>
      ProductInputModel(
          input: InputModel.fromJson(json["machine_input"]),
          product: ProductModel.fromJson(json["item"]));
}
