import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/proof_identity_document/preview_screen.dart';

import '../../widgets/arrow_back_button.dart';
import '../../widgets/circle_checkbox_text.dart';
import '../../widgets/custom_button.dart';

class ProofIdentityScreen extends StatelessWidget {
  const ProofIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isChecked2 = true.obs;
    RxBool isChecked3 = false.obs;
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.015, horizontal: mediaQuerySize.width * 0.05.w),
        child: Column(
          children: [
            ArrowBackButton(
              backgroundColor: Colors.black.withOpacity(0.07),
              arrowColor: AppColors.lightBlackColor,
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.06.h,
            ),
            Center(
                child: Text(
              'Proof of Identity',
              style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.blackColor, fontSize: 20),
            )),
            SizedBox(
              height: mediaQuerySize.height * 0.035.h,
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Select document type',
                  style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.lightBlackColor),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: mediaQuerySize.height * 0.01.h,
            ),
            Text(
              'Choose the type of document you would like to upload for verification. ',
              style: AppTextstyles.simpleText().copyWith(color: AppColors.shadowColor2, fontSize: 13),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            CircleCheckBox(text: 'National ID', isChecked: isChecked2),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            CircleCheckBox(
              text: 'Character Certificate',
              isChecked: isChecked3,
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.05.h,
            ),
            CustomButton(
                onTap: () {
                  if (isChecked2.value || isChecked3.value) {
                    Get.to(() => PreviewScreen(
                          isCharacterCertificate: isChecked3.value,
                          isIdCard: isChecked2.value,
                        ));
                  }
                },
                name: 'Continue'),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
          ],
        ),
      )),
    );
  }
}
