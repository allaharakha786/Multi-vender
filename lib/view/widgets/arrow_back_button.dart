import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArrowBackButton extends StatelessWidget {
  final Color? color;
  
   ArrowBackButton({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
              padding: const EdgeInsets.only(top: 49,left: 11),
              child: Container(
                height: mediaQuerySize.height*0.05.h,
                width: mediaQuerySize.width*0.11.w,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle
                ),
                child: IconButton(onPressed: (){},
                 icon:Icon(Icons.arrow_back)),
              ),
            ),
    );
  }
}
