class MachineInfoModel {
  int id;
  int numberOfBoard;
  int inputPerBoard;
  MachineInfoModel(
      {required this.id,
      required this.numberOfBoard,
      required this.inputPerBoard});
  factory MachineInfoModel.fromJson(Map<String, dynamic> json) =>
      MachineInfoModel(
          id: json["id"],
          numberOfBoard: json["number_of_boards"],
          inputPerBoard: json["input_per_board"]);
}
