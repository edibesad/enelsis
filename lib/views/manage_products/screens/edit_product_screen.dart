import 'package:enelsis/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.name!),
      ),
      body: const Center(
          child: Column(
        children: [],
      )),
    );
  }
}
