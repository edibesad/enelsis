class InputModel {
  int order;
  int board;
  InputModel({required this.order, required this.board});
  factory InputModel.fromJson(Map<String, dynamic> json) =>
      InputModel(order: json["order"], board: json["board"]);
}
