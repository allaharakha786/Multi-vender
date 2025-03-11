import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/controllers/utils/snackbar.dart';
import 'package:multi_vender/controllers/utils/validation_extensions.dart';
import 'package:multi_vender/view/screens/proof_identity_document/proof_identity_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controllers/getxControllers/otp_verifi_cpntroller.dart';
import '../../widgets/arrow_back_button.dart';
import '../../widgets/custom_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  String? email;
  VerificationCodeScreen({super.key, this.email});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final VerificationController controller = Get.put(VerificationController());

  AuthController authController = Get.find();

  TextEditingController pinCodeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.01.h, horizontal: mediaQuerySize.width * 0.06.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ArrowBackButton(
                  backgroundColor: AppColors.textFieldColor,
                  arrowColor: AppColors.lightBlackColor,
                ),
                SizedBox(height: mediaQuerySize.height * 0.06.h),
                Center(
                  child: Text('Verification Code', style: AppTextstyles.simpleTextMedium().copyWith(fontSize: 20, color: AppColors.blackColor)),
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.06.w),
                  child: Text('Enter your Email Address to receive email address.', textAlign: TextAlign.center, style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor)),
                ),
                SizedBox(height: mediaQuerySize.height * 0.01.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.04),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    controller: pinCodeController,
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: AppColors.shadowColor2,
                      borderRadius: BorderRadius.circular(15),
                      // fieldHeight: mediaQuerySize.height * 0.085.h,
                      // fieldWidth: mediaQuerySize.width * 0.166.w,
                      selectedColor: AppColors.buttonColor,
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                Obx(
                  () => CustomButton(
                      isLoading: authController.otpCodeLoading.value,
                      width: mediaQuerySize.width,
                      name: 'Confirm',
                      isEnabled: controller.isButtonEnabled.value,
                      onTap: () async {
                        if (pinCodeController.text.length < 6) {
                          showErrorSnackbar('Please enter full pin code');
                        } else {
                          await authController.verifyOtpController(email: widget.email ?? '', otpCode: pinCodeController.text).then(
                            (value) {
                              if (value == true) {
                                Get.to(() => ProofIdentityScreen());
                              }
                            },
                          );
                        }
                      }),
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
