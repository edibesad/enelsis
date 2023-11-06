// class MachineTypeModel {
//   int? id;
//   String? name;

//   MachineTypeModel({required this.id, required this.name});

//   factory MachineTypeModel.fromJson(Map<String, dynamic> json) =>
//       MachineTypeModel(id: json["id"], name: json["name"]);
// }

import 'package:enelsis/core/base/model/base_model.dart';

class MachineTypeModel extends BaseModel {
  int? id;
  String? name;

  MachineTypeModel({this.id, this.name});

  MachineTypeModel.fromJson(Map<String, dynamic> json) {
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
    return MachineTypeModel.fromJson(json);
  }
}
