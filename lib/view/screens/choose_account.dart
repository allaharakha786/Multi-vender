import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/payment_confirmation_screens/payment_confirmation_screen.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class ChooseAccount extends StatelessWidget {
  ChooseAccount({super.key});

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
                    'Choose Account',
                    style: AppTextstyles.simpleTextBold(),
                  )
                ],
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
                          CustomField(text: 'Full Name'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.015.h,
                          ),
                          CustomField(text: 'Card Number'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.015.h,
                          ),
                          CustomField(text: 'Expairation date'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.015.h,
                          ),
                          CustomField(text: 'CVV'),
                          SizedBox(
                            height: mediaQuerySize.height * 0.03,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    onTap: () {
                                      Get.to(() => PaymentConfirmationScreen());
                                    },
                                    name: 'Next'),
                              ),
                            ],
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

  List<String> images = ['assets/images/bank_transfer.png', 'assets/images/easy_paisa.png', 'assets/images/jazz_cash.png'];
}
