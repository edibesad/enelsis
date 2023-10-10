import 'dart:convert';

import 'package:enelsis/models/item_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final AbstractService _service = SimService();

  Future<ItemModel> getItemByInput(int board, int order, int productId) async {
    var json = await _service.fetchItemByInput(board, order, productId);
    if (json.isEmpty) {
      return ItemModel();
    }
    return ItemModel.fromJson(jsonDecode(json));
  }
}
