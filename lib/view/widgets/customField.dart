


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:multi_vender/controllers/getxControllers/password_controller.dart';

class Customfield extends StatelessWidget {
  final String? hintText;
  final Widget? child;
  String? Function(String?)? validator;

   Customfield({super.key,this .hintText,this.child,this.validator});

  @override
 Widget build(BuildContext context) {
 final PasswordController passwordController = Get.put(PasswordController());

  Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
     height: mediaQuerySize.height*0.08.h, // Slightly increased height for better spacing
      width: mediaQuerySize.width*0.9.w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Expanded(
            child: Obx(
              ()=>TextFormField(
                obscureText: !passwordController.isPasswordVisible.value,
                validator:validator ,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: hintText,
                  border: InputBorder.none, // Removes the underline
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black.withOpacity(0.7)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: child,
            )
        ]
      )
    );
 }
}

