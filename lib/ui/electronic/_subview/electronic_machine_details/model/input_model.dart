import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/ui/stock/stock_history/model/item_model.dart';
import '../../../../profile/_subivew/manage_products/model/product_model.dart';

class InputModel extends BaseModel {
  int? id;
  int? board;
  int? inputOrder;
  ProductModel? product;
  ItemModel? item;

  InputModel({this.id, this.board, this.inputOrder, this.product, this.item});

  InputModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    board = json['board'];
    inputOrder = json['input_order'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    item = json['item'] != null ? ItemModel.fromJson(json['item']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['board'] = board;
    data['input_order'] = inputOrder;
    if (product != null) {
      data['product_id'] = product!.id;
    }
    if (item != null) {
      data['item_id'] = item!.id;
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => InputModel.fromJson(json);
}
