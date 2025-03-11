import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';

class FindDoerScreen extends StatefulWidget {
  FindDoerScreen({super.key});

  @override
  State<FindDoerScreen> createState() => _FindDoerScreenState();
}

class _FindDoerScreenState extends State<FindDoerScreen> {
  AuthController authController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authController.getAllDoerListController();

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
                    'Find Doers',
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
                          Column(
                            children: List.generate(
                              authController.getAllDoerDataList.length,
                              (index) {
                                var data = authController.getAllDoerDataList[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.0085.h, horizontal: mediaQuerySize.width * 0.01.w),
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
                                                color: AppColors.blackColor54,
                                              )),
                                          Row(
                                            children: [
                                              Container(
                                                height: mediaQuerySize.height * 0.15.h,
                                                width: mediaQuerySize.width * 0.25,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(fit: BoxFit.cover, image: data.image.isEmpty ? AssetImage('assets/images/recomended_service_image.png') : NetworkImage(data.image))),
                                              ),
                                              SizedBox(
                                                width: mediaQuerySize.width * 0.04,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data.fullName.isEmpty ? "No Name" : data.fullName,
                                                    style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor, fontSize: 13),
                                                  ),
                                                  Text(
                                                    data.skillTitle.isEmpty ? "No skill" : data.skillTitle,
                                                    style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: AppColors.amberColor,
                                                      ),
                                                      Text(
                                                        data.address.isEmpty ? "No address" : data.address,
                                                        style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: AppColors.amberColor,
                                                      ),
                                                      Text(
                                                        '4.9(28 Reviews)',
                                                        style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                                      )
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
