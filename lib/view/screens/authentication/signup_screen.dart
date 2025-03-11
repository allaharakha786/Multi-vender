import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/getxControllers/password_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/controllers/utils/validation_extensions.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/screens/authentication/verification_code_screen.dart';

import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

import '../../widgets/custom_circle.dart';
import '../../widgets/social_mediaicon_widget.dart';
import '../../widgets/terms_contdition_widget.dart';

class SignupScreen extends StatefulWidget {
  bool? isPoster;
  SignupScreen({super.key, this.isPoster = false});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  PasswordController passwordControllers = Get.put(PasswordController());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.find();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05, vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.1.h,
                ),
                OnboardingDots(
                  currentIndex: 0,
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Center(
                    child: Text(
                  'Create Your Account',
                  style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.blackColor),
                )),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: fullNameController,
                  text: 'Full Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: phoneNumberController,
                  text: '+92 | XXX-XXXXXXX',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please fill this field';
                    }
                    if (!value.isValidPhoneNumber) {
                      return 'please enter valid phone number';
                    }
                    if (value.length < 11) {
                      return 'please enter valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: emailController,
                  text: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the following field';
                    }
                    if (!value.isValidEmail) {
                      return 'please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),

                CustomField(
                  controller: cityController,
                  text: 'city',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),

                CustomField(
                  controller: passwordController,
                  text: 'Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                  isSuffixIcon: true,
                  suffixIcon: Obx(
                    () => IconButton(
                      icon: Icon(
                        passwordControllers.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: passwordControllers.togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                // TermsAndConditionsText(),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return CustomButton(
                          isLoading: authController.signUpLoading.value,
                          name: 'Sign up as ${widget.isPoster! ? 'Poster' : 'Doer'}',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              authController.signUpUserController(fullName: fullNameController.text, email: emailController.text, password: passwordController.text, phoneNumber: phoneNumberController.text, isPoster: widget.isPoster ?? false).then(
                                (value) {
                                  if (value == true) {
                                    Get.to(() => VerificationCodeScreen(
                                          email: emailController.text,
                                        ));
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
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.shadowColor2,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or With',
                        style: TextStyle(
                          color: AppColors.shadowColor2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.shadowColor2,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01.w, vertical: mediaQuerySize.height * 0.01.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/google3.png',
                      ),
                      SizedBox(
                        width: mediaQuerySize.width * 0.025,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/fb.png',
                      ),
                      SizedBox(
                        width: mediaQuerySize.width * 0.025,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/appl_img.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mediaQuerySize.width * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' Already have an account?',
                      style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.shadowColor2, fontSize: 14),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text(
                          'Log in',
                          style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.amberColor),
                        ))
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.05,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
