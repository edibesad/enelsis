import 'package:enelsis/core/base/view/base_view.dart';
import 'package:enelsis/ui/stock/stock_query/_subview/stock_query_with_name/view_model/stock_query_with_name_view_model.dart';
import 'package:flutter/material.dart';

class StockQueryWithNameView extends StatelessWidget {
  const StockQueryWithNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StockQueryWithNameViewModel>(
      viewModel: StockQueryWithNameViewModel(),
      onPageBuild: (context, viewModel) => Container(),
    );
  }
}
