import 'package:enelsis/core/init/network/network_manager.dart';
import 'package:enelsis/product/model/machine_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Network Manager get machines", () {
    test(
      "response should came",
      () async {
        final response = await NetworkManager.instance!
            .dioGet("http://localhost:679/machines", MachineModel());
        print(response.dataList);
        expect(response.result, true);
      },
    );

    test("Data list length should equal totalLen", () async {
      final response = await NetworkManager.instance!
          .dioGet("http://localhost:679/machines", MachineModel());

      expect(response.dataList!.length, response.totalLen);
    });
  });
}
