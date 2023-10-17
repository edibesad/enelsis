// To parse this JSON data, do
//
//     final machineModel = machineModelFromJson(jsonString);

import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/models/machin_type_model.dart';
import 'package:enelsis/models/machine_info_model.dart';
import 'package:enelsis/view/production/_model/machine_task_model.dart';

class MachineModel extends BaseModel {
  int id;
  String name;
  MachineTypeModel type;
  DepartmentModel department;
  MachineInfoModel? info;
  MachineTaskModel? task;

  MachineModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.department,
      this.info,
      this.task});

  factory MachineModel.fromJson(Map<String, dynamic> json) => MachineModel(
        id: json["id"],
        name: json["name"],
        type: MachineTypeModel.fromJson(json),
        department: DepartmentModel.fromJson(json["department"]),
        info: json["info"] == null
            ? null
            : MachineInfoModel.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "department": department.toJson(),
      };

  @override
  fromJson(Map<String, dynamic> json) => MachineInfoModel.fromJson(json);
}
