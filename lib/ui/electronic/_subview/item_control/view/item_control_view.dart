import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/ui/electronic/_subview/item_control/view_model/item_control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ItemControlView extends StatelessWidget {
  const ItemControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ItemControlViewModel(),
      onModelReady: (model) {
        model.init();

        model.setContext(context);
      },
      onPageBuild: (context, viewModel) => Scaffold(
        appBar: AppBar(title: const Text("Ürün Kontrol Ekranı")),
        body: Builder(builder: (context) {
          return Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              buildImageOrScanner(viewModel),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        viewModel.mobileScannerController.stop();
                        viewModel.image.value = null;
                        viewModel.image.value = null;
                        viewModel.mobileScannerController.start();
                      },
                      icon: const Icon(Icons.refresh)),
                  SizedBox(
                    width: 20.w,
                  ),
                  IconButton(
                      onPressed: () {
                        viewModel.mobileScannerController.switchCamera();
                      },
                      icon: const Icon(Icons.cameraswitch)),
                  SizedBox(
                    width: 20.w,
                  ),
                  IconButton(
                      onPressed: () {
                        viewModel.mobileScannerController.toggleTorch();
                      },
                      icon: const Icon(Icons.flashlight_on))
                ],
              ),
              SizedBox(
                height: ScreenUtil().screenHeight * .35,
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: const Text("Giriş numarası"),
                        subtitle:
                            Text((viewModel.input.input.order).toString()),
                      ),
                    ),
                    buildShouldUseItem(viewModel),
                    Card(
                      child: ListTile(
                        title: const Text("Doğruluk durumu"),
                        trailing: Obx(() => viewModel.qrValue.value == null
                            ? const Icon(Icons.remove)
                            : (viewModel.qrValue.value == 1
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          );
        }),
      ),
    );
  }

  buildImageOrScanner(ItemControlViewModel viewModel) {
    return Obx(() => SizedBox.square(
          dimension: 300.r,
          child: viewModel.image.value == null
              ? buildScanner(viewModel)
              : buildImage(viewModel),
        ));
  }

  Image buildImage(ItemControlViewModel viewModel) {
    return Image.memory(
      viewModel.image.value!,
      fit: BoxFit.fill,
    );
  }

  MobileScanner buildScanner(ItemControlViewModel viewModel) {
    return MobileScanner(
      controller: viewModel.mobileScannerController,
      onDetect: viewModel.onDetect,
    );
  }

  buildShouldUseItem(ItemControlViewModel viewModel) =>
      Obx(() => viewModel.isShouldItemLoading.value
          ? const LoadingWidget()
          : Card(
              child: ListTile(
                title: const Text("Takılması gereken ürün"),
                subtitle: Text(viewModel.item.value!.name ?? "Boş"),
              ),
            ));
}
