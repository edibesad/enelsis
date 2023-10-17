import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/core/constants/navigation/navigation_constants.dart';
import 'package:enelsis/view/home/subfeatures/profile/model/admin_widget_card_model.dart';
import 'package:enelsis/view/home/subfeatures/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onPageBuild: (context, viewModel) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: buildAdminWidgets(viewModel)),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(
                    onPressed: () => viewModel.onLogoutPress,
                    child: const Text("Çıkış Yap")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAdminWidgets(ProfileViewModel viewModel) => GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: [
          buildAdminWidgetCard(
              AdminWidgetCardModel(
                  icon: const Icon(Icons.display_settings, size: 36),
                  title: "Makineleri Yönet",
                  path: NavigationConstants.MANAGE_MACHINES),
              viewModel),
          buildAdminWidgetCard(
            AdminWidgetCardModel(
                icon: const Icon(Icons.manage_accounts, size: 36),
                title: "Kullanıcıları yönet",
                path: NavigationConstants.MANAGE_USERS),
            viewModel,
          ),
          buildAdminWidgetCard(
              AdminWidgetCardModel(
                  path: NavigationConstants.MANAGE_TASKS,
                  icon: const Icon(Icons.task, size: 36),
                  title: "Görevleri Yönet"),
              viewModel),
          buildAdminWidgetCard(
              AdminWidgetCardModel(
                  icon: const Icon(Icons.developer_board),
                  title: "Ürünleri Yönet",
                  path: NavigationConstants.MANAGE_PRODUCTS),
              viewModel)
        ],
      );
  buildAdminWidgetCard(AdminWidgetCardModel card, ProfileViewModel viewModel) =>
      GestureDetector(
        onTap: () => viewModel.onTap(card.path),
        child: Container(
          width: 125.w,
          height: 150.h,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 96, 164)),
              color: const Color.fromARGB(255, 199, 227, 248),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              card.icon,
              SizedBox(
                height: 30.h,
              ),
              Text(card.title),
            ],
          ),
        ),
      );
}
