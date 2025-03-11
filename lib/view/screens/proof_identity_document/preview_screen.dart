import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vender/controllers/auth_apis/auth_apis.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/screens/proof_identity_document/register_successfull.dart';
import '../../widgets/custom_circle.dart';
import '../../widgets/image_picker_widget.dart';
import '../../widgets/arrow_back_button.dart';
import '../../widgets/custom_button.dart';

class PreviewScreen extends StatelessWidget {
  bool isIdCard;
  bool isCharacterCertificate;

  PreviewScreen({super.key, this.isIdCard = false, this.isCharacterCertificate = false});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.08.w, vertical: mediaQuerySize.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrowBackButton(
                  backgroundColor: AppColors.textFieldColor,
                  arrowColor: AppColors.lightBlackColor,
                ),
                SizedBox(height: mediaQuerySize.height * 0.05.h),
                OnboardingDots(currentIndex: 2),
                SizedBox(height: mediaQuerySize.height * 0.05.h),
                Center(
                  child: Text(
                    'Preview',
                    style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.blackColor),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                !isIdCard ? SizedBox() : Text('Front side', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.lightBlackColor, fontSize: 14)),
                !isIdCard ? SizedBox() : SizedBox(height: mediaQuerySize.height * 0.02.h),
                !isIdCard
                    ? SizedBox()
                    : ImagePickerWidget(
                        isFrontId: true,
                        imageSource: ImageSource.gallery,
                        buttonText: "File Upload",
                        buttonIcon: Icons.upload_file,
                      ),
                !isIdCard ? SizedBox() : SizedBox(height: mediaQuerySize.height * 0.02.h),
                !isIdCard
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Back side', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.lightBlackColor, fontSize: 14)),
                      ),
                !isIdCard ? SizedBox() : SizedBox(height: mediaQuerySize.height * 0.02.h),
                !isIdCard
                    ? SizedBox()
                    : ImagePickerWidget(
                        isBackId: true,
                        imageSource: ImageSource.gallery,
                        buttonText: "File Upload",
                        buttonIcon: Icons.upload_file,
                      ),
                !isCharacterCertificate ? SizedBox() : SizedBox(height: mediaQuerySize.height * 0.02.h),
                !isCharacterCertificate
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Character Certificate', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.lightBlackColor, fontSize: 14)),
                      ),
                !isCharacterCertificate ? SizedBox() : SizedBox(height: mediaQuerySize.height * 0.02.h),
                !isCharacterCertificate
                    ? SizedBox()
                    : ImagePickerWidget(
                        isCharacterCertificate: true,
                        imageSource: ImageSource.gallery,
                        buttonText: "File Upload",
                        buttonIcon: Icons.upload_file,
                      ),
                SizedBox(height: mediaQuerySize.height * 0.05.h),
                Obx(() {
                  return CustomButton(
                      isLoading: authController.isDocumentVerificationLoading.value,
                      onTap: () {
                        authController.documentVerificationController(characterCertificatePath: authController.characterCertificate.value, nationalIdBackPath: authController.idCardFront.value, nationalIdFrontPath: authController.idCardBack.value).then(
                          (value) {
                            if (value == true) {
                              return LoginScreen();
                            }
                          },
                        );
                      },
                      width: mediaQuerySize.width * 0.9.w,
                      name: 'Upload');
                }),
                SizedBox(height: mediaQuerySize.height * 0.08.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
