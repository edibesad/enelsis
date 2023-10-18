import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/model/user_model.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/profile/_subivew/manage_users/view_model/manage_users_view_model.dart';
import 'package:flutter/material.dart';

class ManageUsersView extends StatelessWidget {
  const ManageUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ManageUsersViewModel(),
      onModelReady: (model) {
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar() => AppBar(
        title: const Text("Kullanıcıları Yönet"),
      );

  buildBody(ManageUsersViewModel viewModel) => viewModel.isLoading.value
      ? const LoadingWidget()
      : viewModel.users.isEmpty
          ? const Center(
              child: Text("Kullanıcı bulunamadı"),
            )
          : buildListView(viewModel);

  buildListView(ManageUsersViewModel viewModel) => ListView.builder(
        itemBuilder: (context, index) =>
            buildUserCard(viewModel.users[index], viewModel),
      );

  buildUserCard(
    UserModel user,
    ManageUsersViewModel viewModel,
  ) =>
      Card(
        child: ListTile(
          title: Text("${user.name!} ${user.surname!}"),
          leading: const Icon(Icons.person),
          subtitle: Text(user.department!.name!),
          trailing: IconButton(
              onPressed: () => viewModel.navigateUserEdit(user),
              icon: const Icon(Icons.edit)),
        ),
      );
}
