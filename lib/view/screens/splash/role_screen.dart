import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/signup_screen.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/custom_user_widget.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.buttonColor, AppColors.shadowColor2],
          stops: [
            0.3,
            1.0,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: mediaQuerySize.height * 0.05.h,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w),
                  child: ArrowBackButton(
                    backgroundColor: AppColors.whiteColor,
                    arrowColor: AppColors.lightBlackColor,
                  )),
              SizedBox(
                width: mediaQuerySize.width * 0.1.w,
              ),
              Text(
                'Select Your Role',
                style: AppTextstyles.simpleTextMedium().copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: mediaQuerySize.height * 0.03.h,
          ),
          Expanded(
            child: Container(
              width: mediaQuerySize.width.w,
              decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuerySize.height * 0.09.h,
                  ),
                  CustomUserWidget(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      secText: 'You can post a job',
                      text: 'Poster',
                      img: 'assets/images/postr_image.png'),
                  SizedBox(
                    height: mediaQuerySize.height * 0.025.h,
                  ),
                  CustomUserWidget(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      secText: 'You can apply on to the job',
                      text: 'Doer',
                      img: 'assets/images/doerr_image.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
