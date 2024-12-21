import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final String text;
  final bool isSuffix;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  CustomField({
    super.key,
    required this.text,
    this.suffixIcon,
    this.validator,
    this.isSuffix = false,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height * 0.07.h,
      width: mediaQuerySize.width * 0.9.w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: isSuffix ? suffixIcon : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
            hintText: text,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
