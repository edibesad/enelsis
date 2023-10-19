import 'dart:convert';
import 'dart:typed_data';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../model/item_model.dart';

class StockQueryWithQrViewModel extends BaseViewModel {
  MobileScannerController mobileScannerController = MobileScannerController(
    returnImage: true,
  );

  Rxn<Uint8List> image = Rxn();
  RxnInt value = RxnInt();
  var isLoading = false.obs;

  Rx<ItemModel> item = Rx(ItemModel());
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
    final json = jsonDecode(await SimService().fetchItemByID(value.value!));
    final newItem = ItemModel.fromJson(json);
    item.value = newItem;
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
