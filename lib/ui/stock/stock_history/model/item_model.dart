import 'package:enelsis/core/base/model/base_model.dart';

class ItemModel extends BaseModel {
  int? id;
  String? name;
  String? unit;

  ItemModel({this.id, this.name, this.unit});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['unit'] = unit;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ItemModel.fromJson(json);
}
