// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:enelsis/models/department_model.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int? id;
  String? username;
  String? name;
  String? surname;
  String? password;
  DepartmentModel? department;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.surname,
    this.password,
    this.department,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        surname: json["surname"],
        password: json["password"],
        department: json["department"] == null
            ? null
            : DepartmentModel.fromJson(json["department"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "surname": surname,
        "password": password,
        "department": department?.toJson(),
      };
}
