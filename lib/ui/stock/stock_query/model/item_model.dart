import 'package:enelsis/core/base/model/base_model.dart';

class ItemModel extends BaseModel {
  int? id;
  String? name;
  int? quantity;
  String? unit;
  ItemModel({this.id, this.name, this.quantity, this.unit});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
      id: json["id"],
      name: json["name"],
      quantity: json["quantity"],
      unit: json["unit"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "quantity": quantity, "unit": unit};

  @override
  fromJson(Map<String, dynamic> json) => ItemModel.fromJson(json);
}
