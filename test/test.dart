import 'package:enelsis/controller/item_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Data should came", () async {
    final controller = ItemController();
    var data = await controller.getItemByInput(1, 1, 1);
    print(data.name);
    expect(data.id, 1);
  });
}
