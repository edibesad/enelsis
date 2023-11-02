import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/production/machines/view_model/production_machines_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionMachinesView extends StatelessWidget {
  const ProductionMachinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductionMachinesViewModel>(
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      viewModel: ProductionMachinesViewModel(),
      onPageBuild: (context, viewModel) => Obx(() => viewModel.isLoading.value
          ? loadingIndicator
          : buildMachinesListView(viewModel)),
    );
  }

  Center get loadingIndicator =>
      const Center(child: CircularProgressIndicator());

  ListView buildMachinesListView(ProductionMachinesViewModel viewModel) =>
      ListView.builder(
          itemCount: viewModel.machines.length,
          itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () =>
                      viewModel.navigateDetails(viewModel.machines[index]),
                  subtitle: buildSubtitle(viewModel, index),
                  title: Text(viewModel.machines[index].name!),
                  leading: buildStatusIcon(viewModel, index),
                  trailing: buildTaskWarn(viewModel, index),
                ),
              ));

  Text? buildSubtitle(ProductionMachinesViewModel viewModel, int index) {
    return (viewModel.machines[index].task == null ||
            viewModel.machines[index].task!.status == null ||
            !viewModel.machines[index].task!.status!)
        ? null
        : Text("Görev İsmi : ${viewModel.machines[index].task!.description}");
  }

  Icon? buildTaskWarn(ProductionMachinesViewModel viewModel, int index) {
    return (viewModel.machines[index].task == null ||
            viewModel.machines[index].task!.status == false)
        ? const Icon(
            Icons.warning,
            color: Colors.red,
          )
        : null;
  }

  Icon buildStatusIcon(ProductionMachinesViewModel viewModel, int index) {
    return viewModel.machines[index].task == null
        ? const Icon(
            Icons.circle,
            color: Colors.red,
          )
        : Icon(
            Icons.circle,
            color:
                generateColorByStatus(viewModel.machines[index].task!.status),
          );
  }

  MaterialColor generateColorByStatus(bool? status) {
    switch (status) {
      case null:
        return Colors.red;
      case false:
        return Colors.amber;
      case true:
        return Colors.green;
    }
  }
}
