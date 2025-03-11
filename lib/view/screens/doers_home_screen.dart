import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_vender/controllers/auth_apis/auth_apis.dart';
import 'package:multi_vender/controllers/camer_controller.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/apply_for_job.dart';
import 'package:multi_vender/view/screens/job_details.dart';
import 'package:multi_vender/view/screens/jobs_screen.dart';
import 'package:multi_vender/view/screens/profile_screen_doer.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class DoersHomeScreen extends StatefulWidget {
  DoersHomeScreen({super.key});

  @override
  State<DoersHomeScreen> createState() => _DoersHomeScreenState();
}

AuthController authController = Get.find();

class _DoersHomeScreenState extends State<DoersHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authController.getCurrentDoerJobs();
    authController.getRecommendedJobsDoersController();
    authController.getAllJobsController();
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
            colors: [AppColors.buttonColor, Color.fromARGB(78, 18, 28, 16)],
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
                        Get.to(ProfileScreenDoer());
                      },
                      child: Container(
                        height: mediaQuerySize.height * 0.07.h,
                        width: mediaQuerySize.width * 0.12.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.contain, image: AssetImage('assets/images/profile_image.png'))),
                      ),
                    ),
                    Container(
                      height: mediaQuerySize.height * 0.07.h,
                      width: mediaQuerySize.width * 0.12.w,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/notification_icon.png'))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03),
                child: CustomField(
                  color: Colors.white,
                  text: 'search for posters',
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
                          CommonWidgets.commonRow('Current Jobs', 'View all'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02.h,
                          ),
                          Column(
                            children: List.generate(
                              authController.currentDoerJobsDataList.length,
                              (index) {
                                var currentJobs = authController.currentDoerJobsDataList[index];
                                return CommonWidgets.CommonJobTemplete(
                                  mediaQuerySize: mediaQuerySize,
                                  title: currentJobs.title,
                                  cash: currentJobs.amount,
                                  location: currentJobs.address,
                                  price: currentJobs.amount,
                                  status: currentJobs.status,
                                  isSecondIcon: false,
                                  time: currentJobs.datePosted.toIso8601String(),
                                  onTapViewDetails: () {
                                    Get.to(JobDetailsScreen(
                                      amount: currentJobs.amount,
                                      id: currentJobs.id,
                                      isApplyNow: false,
                                      location: currentJobs.address,
                                      title: currentJobs.title,
                                      time: currentJobs.datePosted.toIso8601String(),
                                      skillRequirement: currentJobs.skillRequirements,
                                      paymentType: currentJobs.paymentType,
                                    ));
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          CustomButton(
                            name: 'Apply for job',
                            onTap: () {
                              Get.to(JobScreen());
                            },
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.to(JobScreen());
                              },
                              child: CommonWidgets.commonRow(
                                'New Jobs',
                                'View all',
                              )),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          Column(
                            children: List.generate(
                              authController.recommendedJobsDoerDataList.length,
                              (index) {
                                var recommendedJobs = authController.recommendedJobsDoerDataList[index];
                                return CommonWidgets.CommonJobTemplete(
                                  mediaQuerySize: mediaQuerySize,
                                  cash: recommendedJobs.amount,
                                  location: recommendedJobs.address,
                                  price: recommendedJobs.amount,
                                  title: recommendedJobs.title,
                                  time: recommendedJobs.datePosted.toIso8601String(),
                                  status: recommendedJobs.status,
                                  onTapUpdateStatus: () {
                                    Get.to(ApplyForJobScreen(
                                      id: recommendedJobs.id,
                                    ));
                                  },
                                  onTapViewDetails: () {
                                    Get.to(JobDetailsScreen(
                                      paymentType: recommendedJobs.paymentType,
                                      amount: recommendedJobs.amount,
                                      id: recommendedJobs.id,
                                      location: recommendedJobs.address,
                                      time: recommendedJobs.datePosted.toString(),
                                      title: recommendedJobs.title,
                                      skillRequirement: recommendedJobs.skillRequirements,
                                    ));
                                  },
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
