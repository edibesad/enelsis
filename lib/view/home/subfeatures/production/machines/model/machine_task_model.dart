import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/view/home/subfeatures/production/machines/model/task_type_model.dart';
import '../../../../../../core/base/model/base_model.dart';

class MachineTaskModel extends BaseModel {
  int? id;
  String? name;
  UserModel? createdBy;
  DateTime? createdAt;
  bool? status;
  TaskTypeModel? taskTypeModel;
  String? description;

  MachineTaskModel(
      {this.id,
      this.name,
      this.createdBy,
      this.status,
      this.createdAt,
      this.taskTypeModel,
      this.description});

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "task_type": taskTypeModel?.toJson(),
        "name": name,
        "created_by": createdBy?.toJson(),
        "status": status,
        "created_at": createdAt,
        "description": description
      };

  @override
  fromJson(Map<String, dynamic> json) => MachineTaskModel(
      id: json["id"],
      taskTypeModel: TaskTypeModel().fromJson(json),
      name: json["name"],
      createdBy: json["created_by"] == null
          ? null
          : UserModel.fromJson(json["created_by"]),
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      description: json["description"]);
}
