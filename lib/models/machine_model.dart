// To parse this JSON data, do
//
//     final machineModel = machineModelFromJson(jsonString);

import 'dart:convert';

import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/models/machin_type_model.dart';

MachineModel machineModelFromJson(String str) =>
    MachineModel.fromJson(json.decode(str));

String machineModelToJson(MachineModel data) => json.encode(data.toJson());

class MachineModel {
  int? id;
  String? name;
  MachineTypeModel? type;
  DepartmentModel? department;

  MachineModel({
    this.id,
    this.name,
    this.type,
    this.department,
  });

  factory MachineModel.fromJson(Map<String, dynamic> json) => MachineModel(
        id: json["id"],
        name: json["name"],
        type: json["type"] == null ? null : MachineTypeModel.fromJson(json),
        department: json["department"] == null
            ? null
            : DepartmentModel.fromJson(json["department"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "department": department?.toJson(),
      };
}
