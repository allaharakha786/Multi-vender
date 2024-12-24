import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/dashboard.dart';
import 'package:multi_vender/view/screens/job_information.dart';
import 'package:multi_vender/view/screens/notification/notification_screen2.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class PosterHomeScreen extends StatelessWidget {
  PosterHomeScreen({super.key});
  List<String> categoryTitle = ['Repair', 'Yard Work', 'Cleaning'];
  List<String> categoryImages = ['assets/images/repair_image.png', 'assets/images/yard_work_image.png', 'assets/images/cleaning_image.png'];

  @override
  Widget build(BuildContext context) {
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
            colors: [AppColors.buttonColor, Color.fromARGB(78, 18, 28, 16)],
          ))
          // color: Colors.green,
          ,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.02),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: AppTextstyles.simpleTextBold().copyWith(fontSize: 14),
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
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05),
                child: CustomField(
                  color: Colors.white,
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
                  // height: mediaQuerySize.height,
                  // width: mediaQuerySize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
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
                            height: mediaQuerySize.height * 0.18,
                            width: mediaQuerySize.width,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: mediaQuerySize.width * 0.009,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13), boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 0.4,
                                          blurRadius: 3,
                                          blurStyle: BlurStyle.outer,
                                          offset: Offset(
                                            0,
                                            0.2,
                                          ),
                                          color: Colors.black12),
                                    ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12.withOpacity(0.07),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.045.w),
                                            child: Image.asset(categoryImages[index]),
                                          ),
                                        ),
                                        Text(categoryTitle[index])
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          CustomButton(
                              onTap: () {
                                Get.to(() => JobInformation());
                              },
                              name: 'Post a job'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.015.h,
                          ),
                          CustomButton(
                            name: 'Find Doers',
                            color: Colors.transparent,
                            textStyle: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14),
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          CommonWidgets.commonRow('Recommended Services', 'View all'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          Column(
                            children: List.generate(
                              3,
                              (index) {
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
                                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.025.h),
                                      child: Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Icon(
                                                Icons.more_vert,
                                                color: Colors.black54,
                                              )),
                                          Row(
                                            children: [
                                              Container(
                                                height: mediaQuerySize.height * 0.15.h,
                                                width: mediaQuerySize.width * 0.25,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/recomended_service_image.png'))),
                                              ),
                                              SizedBox(
                                                width: mediaQuerySize.width * 0.04,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Plumbing',
                                                    style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor, fontSize: 13),
                                                  ),
                                                  Text('sara Mayo'),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: Colors.amber,
                                                      ),
                                                      Text('Model Town')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      Text('4.9(28 Reviews)')
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
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
