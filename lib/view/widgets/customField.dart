import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:multi_vender/controllers/getxControllers/password_controller.dart';

class CustomField extends StatelessWidget {
  bool isPrefixIcon;
  bool isSuffixIcon;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  String? Function(String?)? validator;
  final String? text;

  CustomField({super.key, this.text, this.suffixIcon, this.isPrefixIcon = false, this.isSuffixIcon = false, this.prefixIcon, this.color, this.validator});

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.put(PasswordController());

    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      width: mediaQuerySize.width * 0.9.w,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: isPrefixIcon
                ? prefixIcon
                : SizedBox(
                    width: 0,
                  ),
            suffixIcon: isSuffixIcon ? suffixIcon : SizedBox(), // Show icon only if it's not null
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 18),
            hintText: text,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
