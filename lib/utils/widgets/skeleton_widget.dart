import 'package:flutter/material.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({required this.height, required this.width, super.key});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
