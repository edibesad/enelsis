import 'dart:typed_data';
import 'package:enelsis/controller/item_controller.dart';
import 'package:enelsis/models/item_input_model.dart';
import 'package:enelsis/models/item_model.dart';
import 'package:enelsis/utils/widgets/shimmer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ItemControlScreen extends StatefulWidget {
  const ItemControlScreen({super.key});

  @override
  State<ItemControlScreen> createState() => _ItemControlScreenState();
}

class _ItemControlScreenState extends State<ItemControlScreen> {
  Uint8List? image;
  int? value;
  MobileScannerController mobileScannerController = MobileScannerController(
    returnImage: true,
  );
  ProductInputModel input = Get.arguments;
  final itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün Kontrol Ekranı")),
      body: Column(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * .35,
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: const Text("Giriş numarası"),
                    subtitle: Text((input.input.order).toString()),
                  ),
                ),
                FutureBuilder<ItemModel>(
                  future: itemController.getItemByInput(
                      input.input.board, input.input.order, input.product.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerListTile();
                    }
                    if (snapshot.hasError) {
                      return Text("Hata${snapshot.error}");
                    }
                    return Card(
                      child: ListTile(
                        title: const Text("Takılması gereken ürün"),
                        subtitle: Text(snapshot.data!.name ?? "Boş"),
                      ),
                    );
                  },
                ),
                Card(
                  child: ListTile(
                    title: const Text("Doğruluk durumu"),
                    trailing: value == null
                        ? const Icon(Icons.remove)
                        : (value == 1
                            ? const Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                              )),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      mobileScannerController.stop();
                      setState(() {
                        image = null;
                        value = null;
                      });
                      mobileScannerController.start();
                    },
                    icon: const Icon(Icons.refresh)),
                SizedBox(
                  width: 20.w,
                ),
                IconButton(
                    onPressed: () {
                      mobileScannerController.switchCamera();
                    },
                    icon: const Icon(Icons.cameraswitch)),
                SizedBox(
                  width: 20.w,
                ),
                IconButton(
                    onPressed: () {
                      mobileScannerController.toggleTorch();
                    },
                    icon: const Icon(Icons.flashlight_on))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: image == null
                ? MobileScanner(
                    controller: mobileScannerController,
                    onDetect: (barcodes) {
                      mobileScannerController.stop;
                      setState(() {
                        image = barcodes.image;
                        mobileScannerController = MobileScannerController(
                          returnImage: true,
                        );
                        for (var element in barcodes.barcodes) {
                          value = int.tryParse(element.rawValue!);
                        }
                        mobileScannerController.stop();
                      });
                    },
                  )
                : Image.memory(image!),
          )
        ],
      ),
    );
  }
}
