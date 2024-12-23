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

  static Widget CommonJobTemplete({required Size mediaQuerySize, String? image, String? title, String? time, String? location, String? cash, String? status, String? price, Function()? onTapViewDetails, Function()? onTapUpdateStatus}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.0085, horizontal: mediaQuerySize.width * 0.01),
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
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.02.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.07),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(image ?? 'assets/images/cleaning_image.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuerySize.width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? 'House Cleaning',
                        style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor, fontSize: 13),
                      ),
                      Text(time ?? 'Tomarrow, 2:00 AM'),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.amber,
                          ),
                          Text(location ?? 'Model Town')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.money_outlined,
                            color: Colors.amber,
                          ),
                          Text(cash ?? 'Cash')
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [commonShortButton(text: status ?? 'In Progress', backgroundColor: Colors.amber.withOpacity(0.04), textColor: Colors.amber), Text(price ?? '\$20/hour')],
                  )
                ],
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: onTapViewDetails,
                        name: 'View Details',
                        color: Colors.transparent.withOpacity(0),
                        textStyle: AppTextstyles.simpleTextBold().copyWith(color: AppColors.buttonColor),
                      ),
                    ),
                    SizedBox(
                      width: mediaQuerySize.width * 0.03.w,
                    ),
                    Expanded(
                      child: CustomButton(onTap: onTapUpdateStatus, name: 'Update Status', color: AppColors.buttonColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget commonShortButton({required String text, required Color backgroundColor, required Color textColor}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: AppTextstyles.simpleTextBold().copyWith(color: textColor, fontSize: 10),
        ),
      ),
    );
  }
}
