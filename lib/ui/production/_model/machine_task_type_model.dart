import 'package:enelsis/core/base/model/base_model.dart';

class MachineTaskTypeModel extends BaseModel {
  int? id;
  String? name;

  MachineTaskTypeModel({this.id, this.name});

  MachineTaskTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return MachineTaskTypeModel.fromJson(json);
  }
}
