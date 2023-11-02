// class MachineTypeModel {
//   int? id;
//   String? name;

//   MachineTypeModel({required this.id, required this.name});

//   factory MachineTypeModel.fromJson(Map<String, dynamic> json) =>
//       MachineTypeModel(id: json["id"], name: json["name"]);
// }

class MachineTypeModel {
  int? id;
  String? name;

  MachineTypeModel({this.id, this.name});

  MachineTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
