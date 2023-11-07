import 'dart:typed_data';
import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../model/item_stock_model.dart';

class StockQueryWithQrViewModel extends BaseViewModel {
  MobileScannerController mobileScannerController = MobileScannerController(
    returnImage: true,
  );

  Rxn<Uint8List> image = Rxn();
  RxnInt value = RxnInt();
  var isLoading = false.obs;

  Rxn<ItemStockModel> stock = Rxn(ItemStockModel());
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  Future<void> onDetect(BarcodeCapture barcodes) async {
    image.value = barcodes.image;

    for (var element in barcodes.barcodes) {
      value.value = int.tryParse(element.rawValue!);
    }
    mobileScannerController.stop;
    BaseResponseModel<ItemStockModel> response = await networkManagerInstance
        .dioGet("/stock/${value.value}", ItemStockModel());
    if (response.totalLen != 0) {
      stock.value = response.dataList!.first;
    } else {
      stock.value = ItemStockModel();
    }
  }

  void resetOnPressed() {
    mobileScannerController.stop();

    image.value = null;
    value.value = null;
    mobileScannerController = MobileScannerController(returnImage: true);
    mobileScannerController.start();
  }

  void switchCameraOnPress() {
    mobileScannerController.switchCamera();
  }

  void toggleTorchOnPress() {
    mobileScannerController.toggleTorch();
  }
}
