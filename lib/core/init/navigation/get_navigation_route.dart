import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/ui/electronic/_subview/add_input/view/add_input_view.dart';
import 'package:enelsis/ui/electronic/_subview/electronic_machine_details/view/electronic_machine_details_view.dart';
import 'package:enelsis/ui/electronic/_subview/item_control/view/item_control_view.dart';
import 'package:enelsis/ui/home/view/home_view.dart';
import 'package:enelsis/ui/production/machine_details/view/machine_details_view.dart';
import 'package:enelsis/ui/production/task_history/_subview/edit_task/view/edit_task_view.dart';
import 'package:enelsis/ui/production/task_history/view/task_history_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/_subview/add_item/view/add_item_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_items/_subview/edit_item/view/edit_item_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/_subview/edit_machine/view/edit_machine_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/view/manage_machines_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/_subview/add_product/view/add_product_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/_subview/edit_product/view/edit_product_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_products/view/manage_product_view.dart';
import 'package:enelsis/ui/profile/_subivew/manage_users/view/manage_users_view.dart';
import 'package:enelsis/ui/stock/stock_history/view/stock_history_view.dart';
import 'package:get/get.dart';
import '../../../ui/authenticate/login/view/login_view.dart';
import '../../../ui/profile/_subivew/manage_items/view/manage_items_view.dart';
import '../../../ui/profile/_subivew/manage_users/_subview/edit_user/view/edit_user_view.dart';

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
      page: () => const EditTaskView(),
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
      page: () => const ElectronciMachineDetailsView(),
    ),
    GetPage(
      name: NavigationConstants.ITEM_CONTROL,
      page: () => const ItemControlView(),
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
    ),
    GetPage(
      name: NavigationConstants.ADD_INPUT,
      page: () => const AddInputView(),
    ),
    GetPage(
      name: NavigationConstants.ADD_PRODUCT,
      page: () => const AddProductView(),
    ),
    GetPage(
      name: NavigationConstants.MANAGE_ITEMS,
      page: () => const ManageItemsView(),
    ),
    GetPage(
      name: NavigationConstants.EDIT_ITEM,
      page: () => const EditItemView(),
    ),
    GetPage(
      name: NavigationConstants.ADD_ITEM,
      page: () => const AddItemView(),
    )
  ];
}
