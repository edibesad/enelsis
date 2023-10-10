import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.validator});
  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator validator;
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
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
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
