// // To parse this JSON data, do
// //
// //     final machineModel = machineModelFromJson(jsonString);

// import 'package:enelsis/core/base/model/base_model.dart';
// import 'package:enelsis/models/department_model.dart';
// import 'package:enelsis/models/machin_type_model.dart';
// import 'package:enelsis/models/machine_info_model.dart';
// import 'package:enelsis/ui/production/_model/machine_task_model.dart';

// class MachineModel extends BaseModel {
//   int id;
//   String name;
//   MachineTypeModel type;
//   DepartmentModel department;
//   MachineInfoModel? info;
//   MachineTaskModel? task;

//   MachineModel(
//       {required this.id,
//       required this.name,
//       required this.type,
//       required this.department,
//       this.info,
//       this.task});

//   factory MachineModel.fromJson(Map<String, dynamic> json) => MachineModel(
//         id: json["id"],
//         name: json["name"],
//         type: MachineTypeModel.fromJson(json),
//         department: DepartmentModel.fromJson(json["department"]),
//         info: json["info"] == null
//             ? null
//             : MachineInfoModel.fromJson(json["info"]),
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "type": type,
//         "department": department.toJson(),
//       };

//   @override
//   fromJson(Map<String, dynamic> json) => MachineInfoModel.fromJson(json);
// }

import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/models/machin_type_model.dart';
import 'package:enelsis/models/machine_info_model.dart';
import 'package:enelsis/ui/production/_model/machine_task_model.dart';

class MachineModel extends BaseModel {
  int? id;
  String? name;
  MachineTypeModel? type;
  MachineTaskModel? task;
  MachineInfoModel? info;

  MachineModel({this.id, this.name, this.type, this.task, this.info});

  MachineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type =
        json['type'] != null ? MachineTypeModel.fromJson(json['type']) : null;
    task =
        json['task'] != null ? MachineTaskModel.fromJson(json['task']) : null;
    info =
        json['info'] != null ? MachineInfoModel.fromJson(json['info']) : null;
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (task != null) {
      data['task'] = task!.toJson();
    }
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return MachineModel.fromJson(json);
  }
}
