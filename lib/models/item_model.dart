class ItemModel {
  int? id;
  String? name;
  int? quantity;
  String? unit;
  ItemModel({this.id, this.name, this.quantity, this.unit});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
      id: json["id"],
      name: json["name"],
      quantity: json["quantity"],
      unit: json["unit"]);
}
