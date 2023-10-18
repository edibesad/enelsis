import 'dart:convert';

import 'package:enelsis/controller/item_controller.dart';
import 'package:enelsis/ui/stock/stock_query/model/item_model.dart';
import 'package:enelsis/services/abstract_service.dart';
import 'package:enelsis/services/sim_service.dart';
import 'package:flutter_test/flutter_test.dart';

ItemController controller = ItemController();
AbstractService service = SimService();

void main() {
  test("Hata kontrol", () async {
    expect((await getItemByName("su")).length, 1);
  });
  test("Hata kontrol", () async {
    expect((await getItemByName("direnç")).length, 7);
  });
  test("Hata kontrol", () async {
    expect((await getItemByName("demir")).length, 1);
  });
  test("Hata kontrol", () async {
    expect((await getItemByName("di")).length, 7);
  });
}

Future<List<ItemModel>> getItemByName(String query) async {
  List data = jsonDecode(await service.fetchItemByName(query));

  return data.map((e) => ItemModel.fromJson(e)).toList();
}

var checkData = [
  {"id": 1, "name": "10k direnç", "quantity": 10, "unit": "Adet"},
  {"id": 2, "name": "20k direnç", "quantity": 20, "unit": "Adet"},
  {"id": 3, "name": "30k direnç", "quantity": 30, "unit": "Adet"},
  {"id": 4, "name": "40k direnç", "quantity": 40, "unit": "Adet"},
  {"id": 5, "name": "50k direnç", "quantity": 50, "unit": "Adet"},
  {"id": 6, "name": "60k direnç", "quantity": 360, "unit": "Adet"},
  {"id": 7, "name": "70k direnç", "quantity": 300, "unit": "Adet"},
  {"id": 8, "name": "Demir", "quantity": 10, "unit": "Ton"},
  {"id": 9, "name": "Su", "quantity": 1000, "unit": "Litre"}
];
