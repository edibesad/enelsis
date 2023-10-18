import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/home/view/home_view.dart';
import 'package:enelsis/ui/production/machine_details/view/machine_details_view.dart';
import 'package:enelsis/ui/production/task_history/view/task_history_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/_subview/edit_product/view/edit_product_view.dart';
import 'package:enelsis/views/manage_task_page/screen/edit_task_screen.dart';
import 'package:enelsis/views/manage_users_page/screen/edit_user_screen.dart';
import 'package:get/get.dart';
import '../../../ui/authenticate/login/view/login_view.dart';
import '../../../views/machines_electonic_page/screens/item_control_screen_with_barcode.dart';
import '../../../views/machines_electonic_page/screens/machine_electronic_detail.dart';
import '../../../views/manage_machine_page/manage_machine_page.dart';
import '../../../views/manage_machine_page/screen/edit_machine_screen.dart';
import '../../../views/manage_products/manage_products.dart';
import '../../../views/manage_users_page/manage_users_page.dart';
import '../../../views/stocks_page/stocks_history/stocks_history.dart';

class GetNavigationRoute {
  GetNavigationRoute._init();
  static final GetNavigationRoute _instance = GetNavigationRoute._init();
  static GetNavigationRoute get instance => _instance;
  static final getPages = [
    GetPage(
      name: NavigationConstants.HOME,
      page: () => const HomeView(),
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
      name: NavigationConstants.TASK_HISTORY,
      page: () => const TaskHistoryView(),
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
      page: () => const EditProductView(),
    ),
    GetPage(
      name: NavigationConstants.STOCK_HISTORY,
      page: () => const StocksHistory(),
    ),
    GetPage(
      name: NavigationConstants.PRODUCTIN_MACHINE_DETAILS,
      page: () => const MachineDetailsView(),
    )
  ];
}
