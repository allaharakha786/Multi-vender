import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';

import 'package:multi_vender/view/widgets/custom_button.dart';

class RegisterSuccessfull extends StatelessWidget {
  const RegisterSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.1.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaQuerySize.height * 0.1.h,
            ),
            Center(
              child: Container(
                height: mediaQuerySize.height * 0.15.h,
                width: mediaQuerySize.width * 0.2.w,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Vector.png'))),
                child: Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: mediaQuerySize.width * 0.12.w,
                ),
              ),
            ),
            Center(
              child: Text(
                'Registration Successful!',
                style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.lightBlackColor),
              ),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.008.h,
            ),
            Text(textAlign: TextAlign.center, 'Your account is awaiting admin approval. You will receive a notification once your profile is activated. ', style: AppTextstyles.simpleText().copyWith(color: AppColors.shadowColor2, fontSize: 15)),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            CustomButton(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                width: mediaQuerySize.width * 0.9.w,
                name: 'Continue'),
          ],
        ),
      )),
    );
  }
}
