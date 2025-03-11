import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/apply_for_job.dart';
import 'package:multi_vender/view/screens/job_details.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';

class JobScreen extends StatefulWidget {
  JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  AuthController authController = Get.find();
  @override
  void initState() {
    authController.getAllJobsController();

    super.initState();
  }

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
            colors: [AppColors.buttonColor, AppColors.shadowColor2],
          )),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.04.w),
                    child: ArrowBackButton(
                      backgroundColor: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: mediaQuerySize.width * 0.25.w,
                  ),
                  Text(
                    'Jobs',
                    style: AppTextstyles.simpleTextMedium().copyWith(fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.02.h,
              ),
              Expanded(
                child: Container(
                  width: mediaQuerySize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.025.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          CommonWidgets.commonRow('New Jobs', 'View all'),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.zero,
                                          contentPadding: EdgeInsets.zero,
                                          actionsPadding: EdgeInsets.zero,
                                          content: Container(
                                            width: mediaQuerySize.width,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05, vertical: mediaQuerySize.height * 0.06),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                                    child: Text('Filter Jobs'),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor: Colors.white,
                                                        activeColor: Colors.green,
                                                        value: true,
                                                        onChanged: (value) {},
                                                      ),
                                                      Text('House Cleaning')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor: Colors.white,
                                                        activeColor: Colors.green,
                                                        value: false,
                                                        onChanged: (value) {},
                                                      ),
                                                      Text('Digital marketing')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor: Colors.white,
                                                        activeColor: Colors.green,
                                                        value: true,
                                                        onChanged: (value) {},
                                                      ),
                                                      Text('Plumbing')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        checkColor: Colors.white,
                                                        activeColor: Colors.green,
                                                        value: false,
                                                        onChanged: (value) {},
                                                      ),
                                                      Text('Copywriting')
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.filter_list))),
                          Column(
                            children: List.generate(
                              authController.allJobsDataList.length,
                              (index) {
                                var data = authController.allJobsDataList[index];

                                return CommonWidgets.CommonJobTemplete(
                                  onTapUpdateStatus: () {
                                    Get.to(ApplyForJobScreen(
                                      id: data.id,
                                    ));
                                  },
                                  onTapViewDetails: () {
                                    Get.to(JobDetailsScreen(
                                      paymentType: data.paymentType,
                                      amount: data.amount,
                                      id: data.id,
                                      location: data.address,
                                      time: data.datePosted.toString(),
                                      title: data.title,
                                      skillRequirement: data.skillRequirements,
                                    ));
                                  },
                                  title: data.title,
                                  mediaQuerySize: mediaQuerySize,
                                  cash: data.amount,
                                  image: data.image,
                                  location: data.address,
                                  price: data.amount,
                                  status: data.status,
                                  time: data.datePosted.toIso8601String(),
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
