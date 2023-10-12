import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.validator,
      this.prefixIcon,
      this.onChanged});
  final TextEditingController? controller;
  final String? labelText;
  final FormFieldValidator? validator;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Color(Colors.black.withOpacity(.15).value),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelText: labelText,
              alignLabelWithHint: false,
              floatingLabelBehavior: FloatingLabelBehavior.auto),
        ),
      ),
    );
  }
}
