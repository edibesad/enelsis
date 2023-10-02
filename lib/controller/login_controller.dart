import 'package:enelsis/models/department_model.dart';
import 'package:enelsis/models/user_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  var user = UserModel(
          id: 1,
          name: "name",
          surname: "surname",
          department: DepartmentModel(id: 0, name: "name"))
      .obs;
}
