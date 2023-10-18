import '../../../ui/production/machines/model/machine_model.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/model/product_model.dart';
import 'package:get/get.dart';

class MachineElectronicPageController extends GetxController {
  var chosenBoard = RxnInt();
  Rx<ProductModel?> chosenProduct = Rx<ProductModel?>(null);
  Rx<MachineModel?> machine = Rx<MachineModel?>(null);
}
