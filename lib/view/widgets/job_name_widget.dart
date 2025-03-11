import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';

class JobNameWidget extends StatelessWidget {
  const JobNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Card(
      elevation: 0,
      child: Container(
        width: mediaQuerySize.width * 0.9.w,
        padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey)]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Job Name', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)), Text('Total', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13))],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time: 8:00 AM', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
                      Text('Date:22 Mar 2021, Sunday', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
                    ],
                  ),
                  Text('\$95.00', style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.buttonColor, fontSize: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Location: 1012 Ocean avanue, New york, USA', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Service Cost: \$100.00', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Tax/Fees: \$10.00', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Amount Paid: \$95.00', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Payment Method:Paid via Visa', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Transaction ID:1234567890', style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
