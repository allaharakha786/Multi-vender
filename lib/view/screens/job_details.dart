import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/apply_for_job.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class JobDetailsScreen extends StatefulWidget {
  String? imagePath;
  String? title;
  String? time;
  String? location;
  String? skillRequirement;
  String? paymentType;
  String? amount;
  int? id;
  bool? isApplyNow;

  JobDetailsScreen({super.key, this.amount, this.imagePath, this.location, this.paymentType, this.skillRequirement, this.time, this.title, this.id, this.isApplyNow = true});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: mediaQuerySize.height,
            width: mediaQuerySize.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [AppColors.buttonColor, Color.fromARGB(78, 18, 28, 16)],
            )),
            child: Obx(() {
              return authController.profileLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ))
                  : Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03, horizontal: mediaQuerySize.width * 0.04),
                              child: ArrowBackButton(
                                backgroundColor: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(
                              width: mediaQuerySize.width * 0.14.w,
                            ),
                            Text(
                              'Job Detail',
                              style: AppTextstyles.simpleTextBold(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.01.h, // mediaQuerySize.height * 0.05.h,
                        ),
                        Expanded(
                          child: Container(
                            width: mediaQuerySize.width.w,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                            child: SingleChildScrollView(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.035, vertical: mediaQuerySize.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02,
                                  ),
                                  Container(
                                    height: mediaQuerySize.height * 0.2.h,
                                    width: mediaQuerySize.width,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(widget.imagePath ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s"))),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.04,
                                  ),
                                  Text(
                                    widget.title ?? 'Selenium python web scrapping',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.lightBlackColor, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.007,
                                  ),
                                  commonTextWidget(firstText: 'Time: ', secondText: widget.time ?? '12.2.2025'),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.007,
                                  ),
                                  commonTextWidget(firstText: 'Location: ', secondText: widget.location ?? 'Lahore'),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.007,
                                  ),
                                  commonTextWidget(firstText: 'Skill Requirements: ', secondText: widget.skillRequirement ?? 'Software Developer'),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.007,
                                  ),
                                  commonTextWidget(firstText: 'Payment Type: ', secondText: widget.paymentType ?? 'hourly'),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.007,
                                  ),
                                  commonTextWidget(firstText: 'Amount: ', secondText: widget.amount ?? '5000'),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.04,
                                  ),
                                  widget.isApplyNow!
                                      ? CustomButton(
                                          name: 'Apply Now',
                                          onTap: () {
                                            Get.to(ApplyForJobScreen(
                                              id: widget.id!,
                                            ));
                                          },
                                        )
                                      : SizedBox()
                                ],
                              ),
                            )),
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ));
  }

  Widget commonTextWidget({required String firstText, required String secondText}) {
    return Container(
      child: Row(
        children: [
          Text(firstText),
          Expanded(
            child: Text(
              secondText,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.lightBlackColor),
            ),
          )
        ],
      ),
    );
  }
}
