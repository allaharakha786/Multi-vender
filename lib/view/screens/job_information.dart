import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class JobInformation extends StatelessWidget {
  JobInformation({super.key});

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
          )),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03, horizontal: mediaQuerySize.width * 0.04),
                child: ArrowBackButton(
                  backgroundColor: AppColors.whiteColor,
                ),
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              Expanded(
                child: Container(
                  // height: mediaQuerySize.height,
                  width: mediaQuerySize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white,
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
                          Text(
                            'Job Information',
                            style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor),
                          ),
                          CustomField(
                            text: 'Job Title',
                            isPrefixIcon: false,
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.013.h,
                          ),
                          CustomField(
                            text: 'Skill Requirements',
                            isPrefixIcon: false,
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.013.h,
                          ),
                          CustomField(
                            text: 'Job Category',
                            isPrefixIcon: false,
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.013.h,
                          ),
                          CustomField(
                            text: 'Address',
                            isPrefixIcon: false,
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.013.h,
                          ),
                          CustomField(
                            text: 'Date',
                            isPrefixIcon: false,
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.013.h,
                          ),
                          CustomField(
                            text: 'Job Description',
                            isPrefixIcon: false,
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.025.h,
                          ),
                          CustomButton(name: 'Post a Job')
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
