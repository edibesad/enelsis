import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/ui/stock/stock_history/model/item_model.dart';
import 'package:get/get.dart';

class ItemStockModel extends BaseModel {
  int? id;
  int? quantity;
  ItemModel? item;
  ItemStockModel({this.id, this.quantity, this.item});

  factory ItemStockModel.fromJson(Map<String, dynamic> json) => ItemStockModel(
      id: json["id"],
      quantity: json["quantity"],
      item: json["item"] != null ? ItemModel.fromJson(json["item"]) : null);

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
      }..addIf(item != null, "item", item!.id);

  @override
  fromJson(Map<String, dynamic> json) => ItemStockModel.fromJson(json);
}
