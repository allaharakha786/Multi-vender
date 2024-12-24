import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';

import '../../widgets/job_name_widget.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({super.key});

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
                      Container(
                        height: mediaQuerySize.height * 0.3.h,
                        width: mediaQuerySize.width * 0.3.w,
                        decoration: BoxDecoration(
                          color: Color(0xff115740).withOpacity(0.16),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          // Center the smaller container
                          child: Container(
                            height: mediaQuerySize.height * 0.22.h, // Adjust size as needed
                            width: mediaQuerySize.width * 0.22.w, // Adjust size as needed
                            decoration: BoxDecoration(
                              color: Color(0xff115740),
                              shape: BoxShape.circle, // Keep the inner container circular
                            ),
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Center the divider
                          children: List.generate(
                            10, // Number of small lines
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0), // Gap between lines
                              child: Container(
                                height: 2, // Height of the line
                                width: 20, // Width of each line
                                color: Colors.grey.withOpacity(0.6), // Line color
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        'Payment Successful',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                      Center(child: Text('"Your payment was completed\n            successfully"', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300))),
                      SizedBox(
                        height: mediaQuerySize.height * 0.02.h,
                      ),
                      JobNameWidget(),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      Container(
                        width: mediaQuerySize.width * 0.9.w,
                        height: mediaQuerySize.height * 0.07.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff115740)),
                        ),
                        child: Center(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Download Receipt (PDF)',
                                style: TextStyle(color: Color(0xff115740), fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Back to Home',
                            style: TextStyle(color: Color(0xff115740), fontSize: 14, fontWeight: FontWeight.bold),
                          ))
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
