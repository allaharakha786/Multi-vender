import 'package:flutter/material.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';

class CustomField extends StatelessWidget {
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final String? Function(String?)? validator;
  final String? text;
  TextEditingController? controller;
  int? maxLines;
  TextInputType? keyboardType;

  CustomField({super.key, this.text, this.suffixIcon, this.isPrefixIcon = false, this.isSuffixIcon = false, this.prefixIcon, this.color, this.validator, this.controller, this.maxLines, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          fillColor: color ?? AppColors.textFieldColor,
          filled: true,
          prefixIcon: isPrefixIcon ? prefixIcon : null,
          suffixIcon: isSuffixIcon ? suffixIcon : const SizedBox(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.textFieldColor, width: 2),
          ),
          hintStyle: AppTextstyles.simpleText().copyWith(color: AppColors.shadowColor2)),
      style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor),
    );
  }
}
