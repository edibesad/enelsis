class MachineTypeModel {
  int? id;
  String? name;

  MachineTypeModel({required this.id, required this.name});

  factory MachineTypeModel.fromJson(Map<String, dynamic> json) =>
      MachineTypeModel(id: json["id"], name: json["name"]);
}
