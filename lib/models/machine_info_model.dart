// class MachineInfoModel {
//   int id;
//   int numberOfBoard;
//   int inputPerBoard;
//   MachineInfoModel(
//       {required this.id,
//       required this.numberOfBoard,
//       required this.inputPerBoard});
//   factory MachineInfoModel.fromJson(Map<String, dynamic> json) =>
//       MachineInfoModel(
//           id: json["id"],
//           numberOfBoard: json["number_of_boards"],
//           inputPerBoard: json["input_per_board"]);
// }

class MachineInfoModel {
  int? id;
  int? numberOfBoards;
  int? inputPerBoard;

  MachineInfoModel({this.id, this.numberOfBoards, this.inputPerBoard});

  MachineInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberOfBoards = json['number_of_boards'];
    inputPerBoard = json['input_per_board'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number_of_boards'] = numberOfBoards;
    data['input_per_board'] = inputPerBoard;
    return data;
  }
}
