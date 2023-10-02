// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/task_type_model.dart';
import 'package:enelsis/models/user_model.dart';

MachineTaskModel machineTaskModelFromJson(String str) =>
    MachineTaskModel.fromJson(json.decode(str));

String machineTaskModelToJson(MachineTaskModel data) =>
    json.encode(data.toJson());

class MachineTaskModel {
  int? id;
  MachineModel? machine;
  String? name;
  UserModel? createdBy;
  DateTime? createdAt;
  bool? status;
  TaskTypeModel? taskTypeModel;

  MachineTaskModel(
      {this.id,
      this.machine,
      this.name,
      this.createdBy,
      this.status,
      this.createdAt,
      this.taskTypeModel});

  factory MachineTaskModel.fromJson(Map<String, dynamic> json) =>
      MachineTaskModel(
          id: json["id"],
          taskTypeModel: TaskTypeModel.fromJson(json["task_type"]),
          machine: json["machine"] == null
              ? null
              : MachineModel.fromJson(json["machine"]),
          name: json["name"],
          createdBy: json["created_by"] == null
              ? null
              : UserModel.fromJson(json["created_by"]),
          status: json["status"],
          createdAt: DateTime.parse(json["created_at"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_type": taskTypeModel?.toJson(),
        "name": name,
        "machine": machine?.toJson(),
        "created_by": createdBy?.toJson(),
        "status": status,
        "created_at": createdAt
      };
}
