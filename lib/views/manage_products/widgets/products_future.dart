import 'package:enelsis/controller/product_controller.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/widget/loading_widget.dart';

class ProductsFuture extends StatelessWidget {
  const ProductsFuture({super.key});

  @override
  Widget build(BuildContext context) {
    var productController = Get.put(ProductController());
    return FutureBuilder<List<ProductModel>>(
      future: productController.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Hata : ${snapshot.error}"),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(snapshot.data![index].name!),
              trailing: IconButton(
                  onPressed: () {
                    Get.toNamed("/edit_product",
                        arguments: snapshot.data![index]);
                  },
                  icon: const Icon(Icons.edit)),
            ),
          ),
        );
      },
    );
  }
}
