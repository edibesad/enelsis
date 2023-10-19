import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/home/view/home_view.dart';
import 'package:enelsis/ui/production/machine_details/view/machine_details_view.dart';
import 'package:enelsis/ui/production/task_history/view/task_history_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/_subview/edit_machine/view/edit_machine_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/view/manage_machines_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/_subview/edit_product/view/edit_product_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/view/manage_product_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_users/view/manage_users_view.dart';
import 'package:enelsis/ui/stock/stock_history/view/stock_history_view.dart';
import 'package:enelsis/views/manage_task_page/screen/edit_task_screen.dart';
import 'package:get/get.dart';
import '../../../ui/authenticate/login/view/login_view.dart';
import '../../../ui/profile/_subivew/manage_users/_subview/edit_user/view/edit_user_view.dart';
import '../../../views/machines_electonic_page/screens/item_control_screen_with_barcode.dart';
import '../../../views/machines_electonic_page/screens/machine_electronic_detail.dart';
import '../../../_trashcan/manage_products/manage_products.dart';

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
      page: () => const ManageUsersView(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_USER,
      page: () => const EditUserView(),
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
      page: () => const ManageMachinesView(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_MACHINE,
      page: () => const EditMachineView(),
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
      page: () => const ManageProductsView(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_PRODUCT,
      page: () => const EditProductView(),
    ),
    GetPage(
      name: NavigationConstants.STOCK_HISTORY,
      page: () => const StockHistoryView(),
    ),
    GetPage(
      name: NavigationConstants.PRODUCTIN_MACHINE_DETAILS,
      page: () => const MachineDetailsView(),
    )
  ];
}
