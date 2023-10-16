import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/views/manage_task_page/manage_task_page.dart';
import 'package:enelsis/views/manage_task_page/screen/edit_task_screen.dart';
import 'package:enelsis/views/manage_users_page/screen/edit_user_screen.dart';
import 'package:get/get.dart';

import '../../../view/autenticate/login/view/login_view.dart';
import '../../../views/home_page/home_page.dart';
import '../../../views/machines_electonic_page/screens/item_control_screen_with_barcode.dart';
import '../../../views/machines_electonic_page/screens/machine_electronic_detail.dart';
import '../../../views/manage_machine_page/manage_machine_page.dart';
import '../../../views/manage_machine_page/screen/edit_machine_screen.dart';
import '../../../views/manage_products/manage_products.dart';
import '../../../views/manage_products/screens/edit_product_screen.dart';
import '../../../views/manage_users_page/manage_users_page.dart';
import '../../../views/stocks_page/stocks_history/stocks_history.dart';

class GetNavigationRoute {
  GetNavigationRoute._init();
  static final GetNavigationRoute _instance = GetNavigationRoute._init();
  static GetNavigationRoute get instance => _instance;
  static final getPages = [
    GetPage(
      name: NavigationConstants.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: NavigationConstants.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: NavigationConstants.MANAGE_USERS,
      page: () => const ManageUsersPage(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_USER,
      page: () => const EditUserScreen(),
    ),
    GetPage(
      name: NavigationConstants.MANAGE_TASKS,
      page: () => ManageTasksPage(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_TASK,
      page: () => const EditTaskScreen(),
    ),
    GetPage(
      name: NavigationConstants.MANAGE_MACHINES,
      page: () => ManageMachinePage(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_MACHINE,
      page: () => const EditMachineScreen(),
    ),
    GetPage(
      name: NavigationConstants.MACHINE_ELECTRONIC_DETAIL,
      page: () => const MachineElectronicDetailPage(),
    ),
    GetPage(
      name: NavigationConstants.ITEM_CONTROL,
      page: () => const ItemControlScreen(),
    ),
    GetPage(
      name: NavigationConstants.MANAGE_PRODUCTS,
      page: () => const ManageProducts(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_PRODUCT,
      page: () => const EditProductScreen(),
    ),
    GetPage(
      name: NavigationConstants.STOCK_HISTORY,
      page: () => const StocksHistory(),
    )
  ];
}
