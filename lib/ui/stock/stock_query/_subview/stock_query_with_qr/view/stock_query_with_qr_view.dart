import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/stock/stock_query/_subview/stock_query_with_qr/view_model/stock_query_with_qr_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class StockQueryWithQrView extends StatelessWidget {
  const StockQueryWithQrView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StockQueryWithQrViewModel>(
      viewModel: StockQueryWithQrViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuild: (context, viewModel) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 500.r,
              child: Card(
                child: Column(
                  children: [
                    buildCamera(viewModel),
                    buildCameraToolbar(viewModel)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            buildItemCard(viewModel)
          ],
        ),
      ),
    );
  }

  buildCamera(StockQueryWithQrViewModel viewModel) {
    return Obx(() => Expanded(
          child: viewModel.image.value != null
              ? Image.memory(
                  viewModel.image.value!,
                  fit: BoxFit.fill,
                )
              : MobileScanner(
                  controller: viewModel.mobileScannerController,
                  onDetect: viewModel.onDetect,
                ),
        ));
  }

  SizedBox buildCameraToolbar(StockQueryWithQrViewModel viewModel) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: viewModel.resetOnPressed,
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: viewModel.switchCameraOnPress,
              icon: const Icon(Icons.cameraswitch)),
          IconButton(
              onPressed: viewModel.toggleTorchOnPress,
              icon: const Icon(Icons.flashlight_on))
        ],
      ),
    );
  }

  buildItemCard(StockQueryWithQrViewModel viewModel) {
    return Obx(() => Card(
          child: SizedBox(
              width: 350.w,
              height: 275.h,
              child: viewModel.value.value == null
                  ? const Center(child: Text("Tarama Bekleniyor"))
                  : viewModel.isLoading.value
                      ? const LoadingWidget()
                      : buildItemInfo(viewModel)),
        ));
  }

  Column buildItemInfo(StockQueryWithQrViewModel viewModel) {
    return Column(
      children: [
        Expanded(
          child: ListTile(
            title: const Text("Malzeme Adı"),
            subtitle: Text(viewModel.stock.value!.item == null ||
                    viewModel.stock.value!.item!.name == null
                ? "Bulunamadı"
                : viewModel.stock.value!.item!.name!),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListTile(
            title: const Text("Stok adedi"),
            subtitle: Text(viewModel.stock.value!.quantity == null
                ? "Bulunamadı"
                : viewModel.stock.value!.quantity.toString()),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text("Birimi"),
          subtitle: Text(viewModel.stock.value!.item == null ||
                  viewModel.stock.value!.item!.unit == null
              ? "Bulunamadı"
              : viewModel.stock.value!.item!.unit!),
        )
      ],
    );
  }
}
