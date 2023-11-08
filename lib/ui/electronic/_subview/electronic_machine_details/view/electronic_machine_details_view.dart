import 'package:enelsis/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../profile/_subivew/manage_products/model/product_model.dart';
import '../view_model/electronic_machine_details_view_model.dart';

class ElectronciMachineDetailsView extends StatelessWidget {
  const ElectronciMachineDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ElectronciMachineDetailsViewModel>(
      viewModel: ElectronciMachineDetailsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(viewModel),
      ),
    );
  }

  buildAppBar() => AppBar(
        title: const Text("Dizgi"),
      );

  buildBody(ElectronciMachineDetailsViewModel viewModel) => Column(children: [
        SizedBox(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: const Text("Makine adı"),
                  subtitle: Text(viewModel.machine!.name!),
                ),
              ),
              Card(
                child: ListTile(
                    title: const Text("Ürün"),
                    trailing: buildDropDown(viewModel)),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              buildBoardRadio(viewModel),
              Expanded(child: buildInputGridView(viewModel)),
            ],
          ),
        )
      ]);

  buildBoardRadio(ElectronciMachineDetailsViewModel viewModel) =>
      Obx(() => Row(children: [
            for (int i = 0; i < viewModel.machine!.info!.numberOfBoards!; i++)
              Expanded(
                child: RadioListTile<int?>(
                  title: Text("Tabla ${i + 1}"),
                  value: i + 1,
                  groupValue: viewModel.chosenBoard.value,
                  onChanged: (value) {
                    viewModel.chosenBoard.value = value;
                  },
                ),
              ),
          ]));

  buildDropDown(ElectronciMachineDetailsViewModel viewModel) =>
      Obx(() => DropdownButton<ProductModel>(
            value: viewModel.chosenProduct.value,
            items: viewModel.products
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name!)))
                .toList(),
            onChanged: (value) {
              viewModel.chosenProduct.value = value;
            },
          ));

  buildInputGridView(ElectronciMachineDetailsViewModel viewModel) =>
      GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemCount: viewModel.machine!.info!.inputPerBoard,
        itemBuilder: (context, index) => Card(
          child: buildGridViewElement(viewModel, context, index),
        ),
      );

  GestureDetector buildGridViewElement(
      ElectronciMachineDetailsViewModel viewModel,
      BuildContext context,
      int index) {
    return GestureDetector(
      onTap: () => viewModel.onGestureTap(index + 1),
      child: Container(
        color: context.theme.primaryColor.withAlpha(100),
        child: Center(
          child: Text(
            (index + 1).toString(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
