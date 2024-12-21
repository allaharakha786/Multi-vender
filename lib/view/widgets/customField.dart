import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final String text;
  final bool isSuffix;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomField({
    Key? key,
    required this.text,
    this.suffixIcon,
    this.validator,
    this.isSuffix = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height*0.08.h, // Slightly increased height for better spacing
      width: mediaQuerySize.width*0.9.w, // Responsive width
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: isSuffix ? suffixIcon : null,
            contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Adjusted padding for alignment
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // No visible border
            ),
            errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red), // Error text styling
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black.withOpacity(0.5)),
          ),
          style: TextStyle(fontSize: 14.sp, color: Colors.black.withOpacity(0.7)),
        ),
      ),
    );
  }
}
