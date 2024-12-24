import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';

import '../../widgets/job_name_widget.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

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
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ArrowBackButton(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    //  SizedBox(width: mediaQuerySize.width*0.05.w,),
                    Padding(
                      padding: const EdgeInsets.only(top: 46, left: 25),
                      child: Text(
                        'Transaction History',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  text: 'Search for radisha...',
                  color: Colors.white,
                  isPrefixIcon: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.06.h,
                ),
                Container(
                  height: mediaQuerySize.height * 0.8.h,
                  width: mediaQuerySize.width * 1.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      CustomField(
                        isSuffixIcon: true,
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
                          child: Text(
                            '\$X,XXX.XX',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: Color(0xff115740),
                        isPrefixIcon: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
                          child: Text(
                            'Total Spent',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      JobNameWidget(),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      JobNameWidget(),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      JobNameWidget(),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
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
