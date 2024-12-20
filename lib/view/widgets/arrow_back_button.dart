import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
              padding: const EdgeInsets.only(top: 49,left: 11),
              child: Container(
                height: mediaQuerySize.height*0.06.h,
                width: mediaQuerySize.width*0.12.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.07),
                  shape: BoxShape.circle
                ),
                child: IconButton(onPressed: (){},
                 icon:Icon(Icons.arrow_back)),
              ),
            ),
    );
  }
}