import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final IconData? suffixIcon;
  final String text;

  CustomField({super.key, required this.text, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height * 0.07.h,
      width: mediaQuerySize.width * 0.9.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 3),
            color: Colors.grey.withOpacity(0.3), // Shadow color
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: Colors.grey,
                  )
                : null, // Show icon only if it's not null
            contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 13),
            hintText: text,
            border: InputBorder.none, // Removes the underline
            hintStyle: TextStyle(color: Colors.grey), // Customize hint style
          ),
          style: TextStyle(color: Colors.black), // Customize input text style
        ),
      ),
    );
  }
}
