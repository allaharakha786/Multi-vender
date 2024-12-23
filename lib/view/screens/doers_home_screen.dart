import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class DoersHomeScreen extends StatelessWidget {
  DoersHomeScreen({super.key});

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
                    Container(
                      height: mediaQuerySize.height * 0.07.h,
                      width: mediaQuerySize.width * 0.12.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.contain, image: AssetImage('assets/images/profile_image.png'))),
                    ),
                    Container(
                      height: mediaQuerySize.height * 0.07.h,
                      width: mediaQuerySize.width * 0.12.w,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/notification_icon.png'))),
                    )
                  ],
                ),
              ),
              CustomField(
                color: Colors.white,
                text: 'search for posters',
                isPrefixIcon: true,
                prefixIcon: Icon(Icons.search),
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
                          CommonWidgets.CommonJobTemplete(mediaQuerySize: mediaQuerySize),
                          CustomButton(name: 'Apply for job'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          CommonWidgets.commonRow('New Jobs', 'View all'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03.h,
                          ),
                          Column(
                            children: List.generate(
                              3,
                              (index) {
                                return CommonWidgets.CommonJobTemplete(mediaQuerySize: mediaQuerySize);
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
