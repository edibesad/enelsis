import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.validator,
      this.prefixIcon,
      this.onChanged,
      this.keyboardType,
      this.inputFormatters,
      this.enabled = true});
  final TextEditingController? controller;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Color(Colors.black.withOpacity(.15).value),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: TextFormField(
          enabled: enabled,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
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
