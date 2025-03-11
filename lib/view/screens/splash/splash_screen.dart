import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/splash/role_screen.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(children: [
              Container(
                width: mediaQuerySize.width.w,
                height: mediaQuerySize.height * 0.7.h,
                decoration: BoxDecoration(),
                child: SvgPicture.asset('assets/svg/splash_bg.svg'),
              ),
            ]),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    width: mediaQuerySize.width * 1.w,
                    child: Image.asset(
                      'assets/images/splash_image.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: mediaQuerySize.width.w,
                    decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), boxShadow: [
                      BoxShadow(blurRadius: 4, spreadRadius: 1, offset: Offset(0, 3)),
                    ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.03.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: mediaQuerySize.height * 0.025.h,
                          ),
                          Text('Welcome to Suneeb', style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.lightBlackColor)),
                          SizedBox(
                            height: mediaQuerySize.height * 0.01.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05),
                            child: Text('From home repairs to creative projects, get it done with ease. On-demand skilled handymen and women at your fingertips. We call them Doers.',
                                textAlign: TextAlign.center, style: AppTextstyles.simpleText().copyWith(color: AppColors.lightBlackColor, fontSize: 14)),
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.023.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  name: 'Get Started',
                                  onTap: () {
                                    Get.to(() => SelectRoleScreen());
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
