import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/product/widget/loading_widget.dart';
import 'package:enelsis/product/widget/task_history_data_table.dart';
import 'package:enelsis/ui/production/task_history/view_model/task_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskHistoryView extends StatelessWidget {
  const TaskHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TaskHistroyViewModel>(
      viewModel: TaskHistroyViewModel(),
      onModelReady: (model) {},
      onPageBuild: (context, viewModel) => Obx(() {
        viewModel.overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;

        return viewModel.isLoading.value
            ? const LoadingWidget()
            : GestureDetector(
                onTapDown: viewModel.getPosition,
                child: Scaffold(body: TaskHistoryDataTable(viewModel.tasks)),
              );
      }),
    );
  }
}
