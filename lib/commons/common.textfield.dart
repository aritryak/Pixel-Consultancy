import 'package:flutter/material.dart';
import 'package:short_video_app/model/color.model.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.prefixicon,
      this.suffixicon,
      this.prefix,
      this.changeobsecure,
      this.maxLength,
      this.maxLines,
      this.validator,
      this.obsecure = false});

  final TextEditingController controller;

  final String hint;

  final IconData? prefixicon;
  final Widget? prefix;
  final IconData? suffixicon;

  final bool obsecure;
  final int? maxLength;
  final int? maxLines;
  final Function? changeobsecure;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      validator: validator,
      controller: controller,
      style: TextStyle(color: AppColors.white),
      obscureText: obsecure,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          prefixStyle: TextStyle(color: AppColors.white),
          hintStyle: TextStyle(
            color: AppColors.white,
          ),
          prefix: prefix,
          suffixIcon: suffixicon != null
              ? GestureDetector(
                  onTap: () {
                    changeobsecure!();
                  },
                  child: Icon(
                    suffixicon,
                    color: AppColors.white,
                  ))
              : null,
          border: border,
          alignLabelWithHint: true,
          label: Text(hint,
             ),
          labelStyle: TextStyle(color: AppColors.white),
          enabledBorder: border,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2)),
          prefixIcon: prefixicon != null
              ? Icon(
                  prefixicon,
                  color: AppColors.white,
                )
              : null,
          isDense: true,
          fillColor: AppColors.white),
    );
  }

  OutlineInputBorder border =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.white));
}
