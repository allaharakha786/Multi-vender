import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';

class DashboadScreen extends StatelessWidget {
  DashboadScreen({super.key});

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.04),
                child: CustomField(
                  color: Colors.white,
                  text: 'search for doers',
                  isPrefixIcon: true,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.025.h,
              ),
              Expanded(
                child: Container(
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
                          Container(
                              height: mediaQuerySize.height * 0.07,
                              width: mediaQuerySize.width * 0.9,
                              decoration: BoxDecoration(border: Border.all(color: AppColors.buttonColor), color: AppColors.buttonColor, borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Spent',
                                      style: AppTextstyles.simpleText(),
                                    ),
                                    Text(
                                      '\$ 50.000',
                                      style: AppTextstyles.simpleTextBold(),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.035.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Job Name', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 16)),
                                      Text('Time: 8:00 AM', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Date: 22 Mar 2021, Sunday', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Location: 1012 Ocean avanue, New york, USA', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Service Cost:\$100', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Tax/Fees: \$100', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Amount Paid: \$100', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Payment Method: Paid vis Visa', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                      Text('Transaction ID: 12232122', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13))
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Total'),
                                    Text(
                                      '\$95.00',
                                      style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.buttonColor, fontSize: 20),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Job Name', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 16)),
                                    Text('Time: 8:00 AM', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Date: 22 Mar 2021, Sunday', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Location: 1012 Ocean avanue, New york, USA', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Service Cost:\$100', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Tax/Fees: \$100', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Amount Paid: \$100', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Payment Method: Paid vis Visa', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
                                    Text('Transaction ID: 12232122', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13))
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Total'),
                                  Text(
                                    '\$95.00',
                                    style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.buttonColor, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
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
