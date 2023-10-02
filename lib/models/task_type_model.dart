class TaskTypeModel {
  int? id;
  String? name;

  TaskTypeModel({
    this.id,
    this.name,
  });

  factory TaskTypeModel.fromJson(Map<String, dynamic> json) => TaskTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
