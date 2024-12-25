import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/view/screens/proof_identity_document/proof_identity_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controllers/getxControllers/otp_verifi_cpntroller.dart';
import '../../widgets/arrow_back_button.dart';
import '../../widgets/custom_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  final VerificationController controller = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.01.h, horizontal: mediaQuerySize.width * 0.06.w),
          child: Column(
            children: [
              ArrowBackButton(
                backgroundColor: AppColors.textFieldColor,
                arrowColor: AppColors.whiteColor,
              ),
              SizedBox(height: mediaQuerySize.height * 0.06),
              Center(
                child: Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.02),
              Text(
                'Enter your Email Address to receive ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: mediaQuerySize.height * 0.01),
              Text(
                'email address.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.04),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    inactiveColor: AppColors.shadowColor2,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: mediaQuerySize.height * 0.085,
                    fieldWidth: mediaQuerySize.width * 0.166,
                    selectedColor: AppColors.buttonColor,
                  ),
                  onChanged: (value) {},
                  onCompleted: (value) {},
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Obx(
                () => CustomButton(
                  width: mediaQuerySize.width * 0.65.w,
                  name: 'Confirm',
                  isEnabled: controller.isButtonEnabled.value,
                  onTap: controller.isButtonEnabled.value
                      ? () {
                          Get.to(() => ProofIdentityScreen());
                        }
                      : null,
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationBox(
    TextEditingController textController,
    int index,
  ) {
    return Obx(
      () => Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: controller.focusStates[index].value ? const Color(0xff115740) : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Focus(
          onFocusChange: (isFocused) {
            controller.updateFocus(index, isFocused);
          },
          child: TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(Get.context!).nextFocus();
              }
              controller.validateInput();
            },
          ),
        ),
      ),
    );
  }
}
