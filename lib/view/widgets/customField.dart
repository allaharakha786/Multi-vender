import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customfield extends StatelessWidget {
  final String text;
   Customfield({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
  height: mediaQuerySize.height * 0.07.h,
  width: mediaQuerySize.width * 0.9.w,
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.5),
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
        
        contentPadding: EdgeInsets.only(left: 8),
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