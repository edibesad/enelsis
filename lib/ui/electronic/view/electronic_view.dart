import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/electronic/view_model/electronic_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectronicView extends StatelessWidget {
  const ElectronicView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ElectronicViewModel>(
        viewModel: ElectronicViewModel(),
        onModelReady: (model) {},
        onPageBuild: (context, viewModel) => Obx(
              () => viewModel.isLoading.value
                  ? const LoadingWidget()
                  : ListView.builder(
                      itemCount: viewModel.machines.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                            leading: const Icon(Icons.circle),
                            title: const Text("Dizgi makinesi"),
                            onTap: () => viewModel
                                .navigateToDetails(viewModel.machines[index])),
                      ),
                    ),
            ));
  }
}
