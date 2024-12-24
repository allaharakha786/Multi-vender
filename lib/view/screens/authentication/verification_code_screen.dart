import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/view/screens/proof_identity_document/proof_identity_screen.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              ArrowBackButton(backgroundColor: Colors.black.withOpacity(0.07)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildVerificationBox(controller.code1, 0),
                  SizedBox(width: mediaQuerySize.width * 0.03),
                  _buildVerificationBox(controller.code2, 1),
                  SizedBox(width: mediaQuerySize.width * 0.03),
                  _buildVerificationBox(controller.code3, 2),
                  SizedBox(width: mediaQuerySize.width * 0.03),
                  _buildVerificationBox(controller.code4, 3),
                ],
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
