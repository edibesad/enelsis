// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/models/department_model.dart';

class UserModel extends BaseModel {
  int? id;
  String? username;
  String? name;
  String? surname;
  String? password;
  bool? isAdmin;
  DepartmentModel? department;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.surname,
      this.password,
      this.department,
      this.isAdmin});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      surname: json["surname"],
      password: json["password"],
      department: json["department"] == null
          ? null
          : DepartmentModel.fromJson(json["department"]),
      isAdmin: json["isAdmin"]);

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "surname": surname,
        "password": password,
        "department": department?.toJson(),
      };

  @override
  fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        surname: json["surname"],
        password: json["password"],
        department: json["department"] == null
            ? null
            : DepartmentModel.fromJson(json["department"]),
      );
}
