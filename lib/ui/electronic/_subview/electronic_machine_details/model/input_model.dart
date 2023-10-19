import 'package:enelsis/core/base/model/base_model.dart';

class InputModel extends BaseModel {
  int order;
  int board;
  InputModel({required this.order, required this.board});
  factory InputModel.fromJson(Map<String, dynamic> json) =>
      InputModel(order: json["order"], board: json["board"]);

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, Object?> toJson() {
    throw UnimplementedError();
  }
}
