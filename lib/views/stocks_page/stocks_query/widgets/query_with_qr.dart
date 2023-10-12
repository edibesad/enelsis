import 'dart:typed_data';

import 'package:enelsis/views/stocks_page/stocks_query/widgets/item_detail_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QueryWithQR extends StatefulWidget {
  const QueryWithQR({super.key});

  @override
  State<QueryWithQR> createState() => _QueryWithQRState();
}

class _QueryWithQRState extends State<QueryWithQR> {
  MobileScannerController mobileScannerController = MobileScannerController(
    returnImage: true,
  );
  Uint8List? image;
  int? value;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350.w,
            height: 350.h,
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: image != null
                        ? Image.memory(
                            image!,
                            fit: BoxFit.fill,
                          )
                        : MobileScanner(
                            controller: mobileScannerController,
                            onDetect: (barcodes) {
                              setState(() {
                                image = barcodes.image;

                                for (var element in barcodes.barcodes) {
                                  value = int.tryParse(element.rawValue!);
                                }
                                mobileScannerController.stop;
                              });
                            },
                          ),
                  ),
                  SizedBox(
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
                              mobileScannerController =
                                  MobileScannerController(returnImage: true);
                              mobileScannerController.start();
                            },
                            icon: const Icon(Icons.refresh)),
                        IconButton(
                            onPressed: () {
                              mobileScannerController.switchCamera();
                            },
                            icon: const Icon(Icons.cameraswitch)),
                        IconButton(
                            onPressed: () {
                              mobileScannerController.toggleTorch();
                            },
                            icon: const Icon(Icons.flashlight_on))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Card(
            child: SizedBox(
                width: 350.w,
                height: 275.h,
                child: ItemDetailFuture(
                  id: value,
                )),
          )
        ],
      ),
    );
  }
}
