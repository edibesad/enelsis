import 'package:enelsis/core/base/model/base_model.dart';

class DepartmentModel extends BaseModel {
  int? id;
  String? name;

  DepartmentModel({
    this.id,
    this.name,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        id: json["id"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  fromJson(Map<String, dynamic> json) => DepartmentModel.fromJson(json);
}
