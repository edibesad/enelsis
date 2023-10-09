import 'dart:convert';

import 'package:enelsis/models/item_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Data should came", () async {
    ItemModel data = (await getItemByInput(20, 20, 20));

    expect(data.id != null, false);
  });

  test("Data should came", () async {
    ItemModel data = (await getItemByInput(1, 1, 1));

    expect(data.id != null, true);
  });

  test("Data should came", () async {
    ItemModel data = (await getItemByInput(2, 1, 1));

    expect(data.id != null, true);
  });
}

getItemByInput(int board, int order, int productId) async {
  AbstractService service = SimService();
  var json = await service.fetchItemByInput(board, order, productId);
  if (json.isEmpty) {
    return ItemModel();
  }
  return ItemModel.fromJson(jsonDecode(json));
}
