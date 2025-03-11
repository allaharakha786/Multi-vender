import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/dashboard.dart';
import 'package:multi_vender/view/screens/find_doers.dart';
import 'package:multi_vender/view/screens/job_information.dart';
import 'package:multi_vender/view/screens/notification/notification_screen2.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class PosterHomeScreen extends StatelessWidget {
  PosterHomeScreen({super.key});
  List<String> categoryTitle = ['Repair', 'Yard Work', 'Cleaning'];
  List<String> categoryImages = ['assets/images/repair_image.png', 'assets/images/yard_work_image.png', 'assets/images/cleaning_image.png'];
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    authController.getAllCategoryListController();

    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: mediaQuerySize.height.h,
          width: mediaQuerySize.width.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [AppColors.buttonColor, AppColors.shadowColor2],
          )),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.02),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // AuthApis().verificationDocumentsUploadMethod(characterCertificate: File(authController.characterCertificate.value));
                          },
                          child: Text(
                            'Welcome to',
                            style: AppTextstyles.simpleTextBold().copyWith(fontSize: 14),
                          ),
                        ),
                        Text(
                          'Suneeb',
                          style: AppTextstyles.simpleTextBold().copyWith(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DashboadScreen());
                      },
                      child: Container(
                        height: mediaQuerySize.height * 0.07.h,
                        width: mediaQuerySize.width * 0.12.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.contain, image: AssetImage('assets/images/profile_image.png'))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => NotificationScreen2());
                      },
                      child: Container(
                        height: mediaQuerySize.height * 0.07.h,
                        width: mediaQuerySize.width * 0.12.w,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/notification_icon.png'))),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w),
                child: CustomField(
                  color: AppColors.whiteColor,
                  text: 'search for doers',
                  isPrefixIcon: true,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: AppColors.whiteColor),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.025.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CommonWidgets.commonRow('Browse Categories', 'View all'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02.h,
                          ),
                          SizedBox(
                            width: mediaQuerySize.width,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: authController.getAllCategoryDataList.length >= 2 ? 2 : authController.getAllCategoryDataList.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                var data = authController.getAllCategoryDataList[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.009.w, vertical: mediaQuerySize.height * 0.01),
                                  child: Container(
                                    decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(13), boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 0.4,
                                          blurRadius: 3,
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(
                                            0,
                                            0.2,
                                          ),
                                          color: AppColors.shadowColor2),
                                    ]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.textFieldColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.045.w),
                                            child: Image.asset(categoryImages[0]),
                                          ),
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          data.name,
                                          style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.015.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    onTap: () {
                                      Get.to(() => JobInformation());
                                    },
                                    name: 'Post a job'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.015.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onTap: () {
                                    Get.to(FindDoerScreen());
                                  },
                                  name: 'Find Doers',
                                  color: Colors.transparent,
                                  textStyle: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          CommonWidgets.commonRow('Recommended Services', 'View all'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          SizedBox(
                            width: mediaQuerySize.width,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: authController.getAllCategoryDataList.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                var data = authController.getAllCategoryDataList[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.009.w, vertical: mediaQuerySize.height * 0.01),
                                  child: Container(
                                    decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(13), boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 0.4,
                                          blurRadius: 3,
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(
                                            0,
                                            0.2,
                                          ),
                                          color: AppColors.shadowColor2),
                                    ]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.textFieldColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.045.w),
                                            child: Image.asset(categoryImages[0]),
                                          ),
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          data.name,
                                          style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
