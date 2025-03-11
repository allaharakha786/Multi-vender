import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class CommonWidgets {
  static Widget commonRow(String firstText, String secondText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor.withOpacity(0.9), fontSize: 15),
        ),
        Text(
          secondText,
          style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor.withOpacity(0.8), fontSize: 11),
        ),
      ],
    );
  }

  static Widget CommonJobTemplete({required Size mediaQuerySize, String? image, String? title, String? time, String? location, String? cash, String? status, String? price, Function()? onTapViewDetails, Function()? onTapUpdateStatus, bool? isSecondIcon = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.0085.h, horizontal: mediaQuerySize.width * 0.01.w),
      child: Container(
        width: mediaQuerySize.width,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0.4,
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(
                    0,
                    0.2,
                  )),
            ],
            borderRadius: BorderRadius.circular(12.sp)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.02.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h),
                      child: Container(
                        height: mediaQuerySize.height * 0.08,
                        width: mediaQuerySize.width * 0.18,
                        decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuerySize.width * 0.04.w,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'House Cleaning',
                          style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor, fontSize: 13),
                        ),
                        Text(
                          time ?? 'Tomarrow, 2:00 AM',
                          style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.amberColor,
                            ),
                            Text(
                              location ?? 'Model Town',
                              style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.money_outlined,
                              color: AppColors.amberColor,
                            ),
                            Text(
                              cash ?? 'Cash',
                              style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [commonShortButton(mediaquerySize: mediaQuerySize, text: status ?? 'In Progress', backgroundColor: AppColors.amberColor.withOpacity(0.1), textColor: AppColors.amberColor), Align(alignment: Alignment.centerRight, child: Text(price ?? '\$20/hour'))],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.015.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: onTapViewDetails,
                        name: 'View Details',
                        color: Colors.transparent.withOpacity(0),
                        textStyle: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.buttonColor),
                      ),
                    ),
                    isSecondIcon!
                        ? SizedBox(
                            width: mediaQuerySize.width * 0.03.w,
                          )
                        : SizedBox(),
                    isSecondIcon
                        ? Expanded(
                            child: CustomButton(textStyle: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.whiteColor), onTap: onTapUpdateStatus, name: 'Apply', color: AppColors.buttonColor),
                          )
                        : SizedBox()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget commonShortButton({required Size mediaquerySize, required String text, required Color backgroundColor, required Color textColor}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: backgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaquerySize.width * 0.02.w, vertical: mediaquerySize.height * 0.01.h),
        child: Text(
          text,
          style: AppTextstyles.simpleTextBold().copyWith(color: textColor, fontSize: 10),
        ),
      ),
    );
  }
}
