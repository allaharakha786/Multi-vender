import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/choose_account.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class ChoosePaymentMethod extends StatelessWidget {
  ChoosePaymentMethod({super.key});

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
                          GridView.builder(
                            itemCount: 3,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.0075),
                                child: Container(
                                  padding: EdgeInsets.all(index == 1 ? 0 : 20),
                                  height: mediaQuerySize.height * 0.04,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black12, image: DecorationImage(scale: index == 1 ? 1.0 : 10, fit: index == 1 ? BoxFit.cover : BoxFit.scaleDown, image: AssetImage(images[index]))),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.035,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    onTap: () {
                                      Get.to(() => ChooseAccount());
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

  List<String> images = ['assets/images/bank_transfer.png', 'assets/images/easy_paisa.jpg', 'assets/images/jazz_cash.png'];
}
