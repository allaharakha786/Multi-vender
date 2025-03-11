import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/screens/authentication/successfully_reset_password.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.01.h, horizontal: mediaQuerySize.width * 0.08.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: mediaQuerySize.height * 0.06.h,
              ),
              Center(child: Text('Forgot Password', style: AppTextstyles.simpleTextMedium().copyWith(fontSize: 18, color: AppColors.blackColor))),
              SizedBox(
                height: mediaQuerySize.height * 0.02.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.1),
                child: Text(textAlign: TextAlign.center, 'Enter your Email Address to receive a password reset link.', style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor)),
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              CustomField(
                controller: emailController,
                text: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return CustomButton(
                        isLoading: authController.forgotPasswordLoading.value,
                        name: 'Send Reset Link',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            authController.forgotPasswordController(email: emailController.text).then(
                              (value) {
                                if (value == true) {
                                  Get.to(() => SuccessfullyPasswordResetted());
                                }
                              },
                            );
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Remember Password? Back to', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.shadowColor2, fontSize: 14)),
                  TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text('Log in', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.amberColor, fontSize: 14)))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
