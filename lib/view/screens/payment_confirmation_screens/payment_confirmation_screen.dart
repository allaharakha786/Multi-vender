import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/job_name_widget.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.buttonColor,
              Colors.grey
              // Colors.white.withOpacity(0.95)
            ])),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.04.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ArrowBackButton(
                      backgroundColor: Colors.white,
                    ),
                    //  SizedBox(width: mediaQuerySize.width*0.05.w,),
                    Padding(
                      padding: const EdgeInsets.only(top: 46, left: 25),
                      child: Text(
                        'Payment Confirmation',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Container(
                  height: mediaQuerySize.height * 0.8.h,
                  width: mediaQuerySize.width * 1.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: mediaQuerySize.height * 0.04.h,
                      ),
                      // CustomField(color: Colors.grey,),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/vise.png',
                                      width: mediaQuerySize.width * 0.1, // Responsive size
                                      height: mediaQuerySize.height * 0.05,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        'Payment Method',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8), // Spacing
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: mediaQuerySize.width * 0.25,
                                    height: mediaQuerySize.height * 0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Color(0xff115740)),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                            color: Color(0xff115740),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8), // Spacing
                                Text(
                                  'Visa ending in 1234',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: mediaQuerySize.height * 0.04.h,
                      ),
                      JobNameWidget(),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      CustomButton(name: 'Confirm Payment')
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
