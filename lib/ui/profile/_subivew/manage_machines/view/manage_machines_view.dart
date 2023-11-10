import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/profile/_subivew/manage_machines/view_model/manage_machines_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMachinesView extends StatelessWidget {
  const ManageMachinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ManageMachinesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(viewModel),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar(ManageMachinesViewModel viewModel) => AppBar(
        title: const Text("Makineleri Yönet"),
        actions: [
          IconButton(
              onPressed: viewModel.onAddMachineTap, icon: const Icon(Icons.add))
        ],
      );

  buildBody(ManageMachinesViewModel viewModel) =>
      Obx(() => viewModel.isLoading.value
          ? const LoadingWidget()
          : viewModel.machines.isEmpty
              ? const Center(
                  child: Text("Makine Bulunamadı"),
                )
              : buildListView(viewModel));

  buildListView(ManageMachinesViewModel viewModel) => ListView.builder(
        itemCount: viewModel.machines.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.precision_manufacturing),
            title: Text(viewModel.machines[index].name!),
            trailing: IconButton(
              onPressed: () =>
                  viewModel.navigateToEdit(viewModel.machines[index]),
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
      );
}
