import 'dart:convert';

import 'package:enelsis/models/item_history_model.dart';
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

  Future<ItemModel> getItemByID(int id) async {
    String jsonString = await _service.fetchItemByID(id);
    if (jsonString.isNotEmpty) {
      return ItemModel.fromJson(jsonDecode(jsonString));
    }

    return ItemModel();
  }

  Future<List<ItemModel>> getItemByName(String query) async {
    List data = jsonDecode(await _service.fetchItemByName(query));

    return data.map((e) => ItemModel.fromJson(e)).toList();
  }

  Future<List<ItemHistoryModel>> getItemHistory() async {
    List data = jsonDecode(await _service.fetchItemHistory());

    return data.map((e) => ItemHistoryModel.fromJson(e)).toList();
  }
}
