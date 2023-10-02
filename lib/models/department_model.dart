class DepartmentModel {
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
