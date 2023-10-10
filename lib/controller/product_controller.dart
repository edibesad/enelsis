import 'dart:convert';

import 'package:enelsis/models/product_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final AbstractService _service = SimService();

  Future<List<ProductModel>> getAllProducts() async {
    String json = await _service.fetchProducts();

    return (jsonDecode(json) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
