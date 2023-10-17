import 'package:enelsis/core/base/model/base_model.dart';

class TaskTypeModel extends BaseModel {
  int? id;
  String? name;

  TaskTypeModel({
    this.id,
    this.name,
  });

  @override
  fromJson(Map<String, dynamic> json) => TaskTypeModel(
        id: json["id"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
