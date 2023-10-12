import 'dart:convert';

import 'package:enelsis/models/item_model.dart';
import 'package:enelsis/models/user_model.dart';

ItemHistoryModel itemHistoryModelFromJson(String str) =>
    ItemHistoryModel.fromJson(json.decode(str));

String itemHistoryModelToJson(ItemHistoryModel data) =>
    json.encode(data.toJson());

class ItemHistoryModel {
  int? id;
  UserModel? createdBy;
  ItemModel? item;
  DateTime? createdAt;
  int? quantity;
  String? description;
  bool? isSpent;

  ItemHistoryModel({
    this.id,
    this.createdBy,
    this.item,
    this.createdAt,
    this.quantity,
    this.description,
    this.isSpent,
  });

  factory ItemHistoryModel.fromJson(Map<String, dynamic> json) =>
      ItemHistoryModel(
        id: json["id"],
        createdBy: json["created_by"] == null
            ? null
            : UserModel.fromJson(json["created_by"]),
        item: json["item"] == null ? null : ItemModel.fromJson(json["item"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        quantity: json["quantity"],
        description: json["description"],
        isSpent: json["is_spent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy?.toJson(),
        "item": item?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "quantity": quantity,
        "description": description,
        "is_spent": isSpent,
      };
}
