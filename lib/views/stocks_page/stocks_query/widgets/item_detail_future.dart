import 'package:enelsis/controller/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailFuture extends StatelessWidget {
  const ItemDetailFuture({
    this.id,
    super.key,
  });
  final int? id;
  @override
  Widget build(BuildContext context) {
    var itemController = Get.put(ItemController());
    return id == null
        ? const Center(
            child: Text("Tarama Bekleniyor"),
          )
        : FutureBuilder(
            future: itemController.getItemByID(id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text("Hata : ${snapshot.error}"),
                );
              }
              if (snapshot.data == null) {
                return const Center(
                  child: Text("Ürün bulunamadı"),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Malzeme Adı"),
                      subtitle: Text(snapshot.data!.name ?? "Bulunamadı"),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListTile(
                      title: const Text("Stok adedi"),
                      subtitle: Text(snapshot.data!.quantity == null
                          ? "Bulunamadı"
                          : snapshot.data!.quantity.toString()),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Birimi"),
                    subtitle: Text(snapshot.data!.unit ?? "Bulunamadı"),
                  )
                ],
              );
            },
          );
  }
}
