// import 'package:enelsis/product/model/user_model.dart';
// import 'package:enelsis/product/model/machine_model.dart';
// import 'package:enelsis/ui/production/machines/model/task_type_model.dart';
// import '../../../core/base/model/base_model.dart';

// class MachineTaskModel extends BaseModel {
//   int? id;
//   String? name;
//   UserModel? createdBy;
//   DateTime? createdAt;
//   bool? status;
//   TaskTypeModel? taskTypeModel;
//   String? description;
//   MachineModel? machine;

//   MachineTaskModel(
//       {this.id,
//       this.name,
//       this.createdBy,
//       this.status,
//       this.createdAt,
//       this.taskTypeModel,
//       this.description,
//       this.machine});

//   @override
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "task_type": taskTypeModel?.toJson(),
//         "name": name,
//         "created_by": createdBy?.toJson(),
//         "status": status,
//         "created_at": createdAt,
//         "description": description,
//         "machine": machine?.toJson()
//       };

//   factory MachineTaskModel.fromJson(Map<String, dynamic> json) =>
//       MachineTaskModel(
//         id: json["id"],
//         taskTypeModel: TaskTypeModel().fromJson(json),
//         name: json["name"],
//         createdBy: json["created_by"] == null
//             ? null
//             : UserModel.fromJson(json["created_by"]),
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         description: json["description"],
//         machine: json["machine"] == null
//             ? null
//             : MachineModel.fromJson(json["machine"]),
//       );

//   @override
//   fromJson(Map<String, dynamic> json) => MachineTaskModel.fromJson(json);
// }

import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/ui/production/_model/machine_task_type_model.dart';

class MachineTaskModel extends BaseModel {
  int? id;
  DateTime? createdAt;
  String? description;
  bool? status;
  UserModel? createdBy;
  MachineModel? machine;
  MachineTaskTypeModel? taskTypeModel;

  MachineTaskModel(
      {this.id,
      this.createdAt,
      this.description,
      this.status,
      this.createdBy,
      this.machine,
      this.taskTypeModel});

  MachineTaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.parse(json['created_at']);
    description = json['description'];
    status = json['status'];
    print(json['created_by']);
    createdBy = json['created_by'] != null
        ? UserModel.fromJson(json['created_by'])
        : null;

    machine =
        json['machine'] != null ? MachineModel.fromJson(json['machine']) : null;

    taskTypeModel = json['type'] != null
        ? MachineTaskTypeModel.fromJson(json['type'])
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['status'] = status;
    if (createdBy != null) {
      data['user'] = createdBy!.toJson();
    }
    if (machine != null) {
      data['machine'] = machine!.toJson();
    }
    if (taskTypeModel != null) {
      data['type'] = taskTypeModel!.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return MachineTaskModel.fromJson(json);
  }
}
