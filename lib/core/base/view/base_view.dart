import 'package:enelsis/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView(
      {super.key,
      required this.viewModel,
      required this.onPageBuild,
      this.onDispose,
      this.onModelReady});
  final Widget Function(BuildContext context, T viewModel) onPageBuild;
  final T viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;
  @override
  void initState() {
    super.initState();
    this.viewModel = Get.put(widget.viewModel);
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
    viewModel.setContext(context);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuild(context, widget.viewModel);
  }

  buildDrawer(viewModel) {}
}
