import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';

class CustomUserWidget extends StatelessWidget {
  final String text;
  final String img;
  final String secText;
  Function()? onTap;
  CustomUserWidget({super.key, required this.text, required this.img, required this.secText, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: mediaQuerySize.height * 0.125.h,
          width: mediaQuerySize.width * 0.8.w,
          decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: AppColors.shadowColor2, blurRadius: 3, spreadRadius: 0, offset: Offset(0, 3))]),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.035.w, vertical: mediaQuerySize.height * 0.01),
                child: Container(
                  height: mediaQuerySize.height * 0.08.h,
                  width: mediaQuerySize.width * 0.16.w,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black.withOpacity(0.07), image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                width: mediaQuerySize.width * 0.005.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(text, style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.blackColor, fontSize: 14)), Text(secText, style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 11))],
              )
            ],
          )),
    );
  }
}
