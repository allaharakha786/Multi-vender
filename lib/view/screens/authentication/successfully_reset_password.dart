import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class SuccessfullyPasswordResetted extends StatelessWidget {
  const SuccessfullyPasswordResetted({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.015.h, horizontal: mediaQuerySize.width * 0.04.w),
        child: Column(
          children: [
            SizedBox(
              height: mediaQuerySize.height * 0.06.h,
            ),
            Center(child: Text('Successfully', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.blackColor, fontSize: 20))),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            Text(textAlign: TextAlign.center, 'A password reset link has been sent to your email address. Please click the link to reset your password.', style: AppTextstyles.simpleText().copyWith(color: AppColors.lightBlackColor, fontSize: 14)),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    name: 'Continue',
                    width: mediaQuerySize.width * 0.9.w,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text(
                  'Back to Login',
                  style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.amberColor),
                )),
          ],
        ),
      )),
    );
  }
}
