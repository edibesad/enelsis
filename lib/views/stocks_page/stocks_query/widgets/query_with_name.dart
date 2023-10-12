import 'dart:async';

import 'package:enelsis/views/stocks_page/stocks_query/widgets/query_results_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QueryWithName extends StatefulWidget {
  const QueryWithName({super.key});

  @override
  State<QueryWithName> createState() => _QueryWithNameState();
}

class _QueryWithNameState extends State<QueryWithName> {
  TextEditingController textEditingController = TextEditingController();
  Timer? _debounce;
  bool isLoading = false;
  String query = "";

  _onSearchChanged(String query) {
    setState(() {
      isLoading = true;
    });
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        isLoading = false;
        this.query = query;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: 400.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: Color(Colors.black.withOpacity(.15).value),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: TextField(
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  labelText: "Ürün adı",
                  alignLabelWithHint: false,
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        isLoading
            ? const CircularProgressIndicator()
            : Expanded(child: QueryResultsFuture(query))
      ],
    );
  }
}
