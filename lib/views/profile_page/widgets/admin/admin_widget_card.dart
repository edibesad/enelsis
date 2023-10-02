import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminWidgetCard extends StatelessWidget {
  const AdminWidgetCard(
      {required this.icon,
      required this.title,
      required this.onTap,
      super.key});
  final VoidCallback onTap;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125.w,
        height: 150.h,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 0, 96, 164)),
            color: const Color.fromARGB(255, 199, 227, 248),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 30.h,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
