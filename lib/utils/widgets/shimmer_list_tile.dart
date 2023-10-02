import 'package:enelsis/utils/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.circle,
          color: Colors.black.withOpacity(.04),
        ),
        title: SkeletonWidget(
          height: 10.h,
          width: 10.w,
        ),
        subtitle: SkeletonWidget(height: 10.h, width: 10.w),
      ),
    );
  }
}
