import 'package:enelsis/views/manage_products/widgets/products_future.dart';
import 'package:flutter/material.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünleri yönet"),
      ),
      body: const ProductsFuture(),
    );
  }
}
