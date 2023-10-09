import 'dart:convert';

import 'package:enelsis/models/item_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  AbstractService service = SimService();

  Future<ItemModel> getItemByInput(int board, int order, int productId) async {
    AbstractService service = SimService();
    var json = await service.fetchItemByInput(board, order, productId);
    if (json.isEmpty) {
      return ItemModel();
    }
    return ItemModel.fromJson(jsonDecode(json));
  }
}
