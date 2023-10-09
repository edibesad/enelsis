import 'package:enelsis/models/machine_model.dart';
import 'package:enelsis/models/product_model.dart';
import 'package:get/get.dart';

class MachineElectronicPageController extends GetxController {
  var chosenBoard = RxnInt();
  Rx<ProductModel?> chosenProduct = Rx<ProductModel?>(null);
  Rx<MachineModel?> machine = Rx<MachineModel?>(null);
}
