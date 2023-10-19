import 'dart:convert';
import 'dart:typed_data';

import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/model/item_input_model.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ItemControlViewModel extends BaseViewModel {
  late ProductInputModel input;
  Rxn<Uint8List> image = Rxn();
  RxnInt qrValue = RxnInt();
  Rxn<ItemModel> item = Rxn();
  Rxn<ItemModel> scannedItem = Rxn();
  var isShouldItemLoading = false.obs;

  MobileScannerController mobileScannerController =
      MobileScannerController(returnImage: true);
  @override
  void init() {
    if (Get.arguments is ProductInputModel) {
      input = Get.arguments;
      getItem();
    }
  }

  getItem() async {
    isShouldItemLoading.value = true;
    final json = jsonDecode(await SimService().fetchItemByInput(
        input.input.board, input.input.order, input.product.id!));
    item.value = ItemModel.fromJson(json);
    isShouldItemLoading.value = false;
  }

  getScannedItem() async {
    final json = jsonDecode(await SimService().fetchItemByID(qrValue.value!));
    scannedItem.value = ItemModel.fromJson(json);
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void onDetect(BarcodeCapture barcodes) {
    {
      mobileScannerController.stop;
      image.value = barcodes.image;
      mobileScannerController = MobileScannerController(
        returnImage: true,
      );
      for (var element in barcodes.barcodes) {
        qrValue.value = int.tryParse(element.rawValue!);
      }
      mobileScannerController.stop();
    }
  }
}
