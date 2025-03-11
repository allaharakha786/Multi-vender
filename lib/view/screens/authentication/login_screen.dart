import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/getxControllers/password_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/forgot_password_screen.dart';
import 'package:multi_vender/view/screens/authentication/signup_screen.dart';
import 'package:multi_vender/view/screens/bottom_navigation_bar.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

import '../../widgets/social_mediaicon_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

GlobalKey<FormState> formKey = GlobalKey();
PasswordController passwordControllers = Get.put(PasswordController());
AuthController authController = Get.find();

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.08.w, vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.08.h,
                ),
                Center(child: Text('Welcome Back', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.blackColor, fontSize: 18))),
                SizedBox(
                  height: mediaQuerySize.height * 0.02.h,
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: emailcontroller,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.012,
                        ),
                        Text('Remember Password', style: AppTextstyles.simpleText().copyWith(color: AppColors.shadowColor2, fontSize: 12)),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => ForgotPasswordScreen());
                        },
                        child: Text('Forget Password?', style: AppTextstyles.simpleText().copyWith(color: AppColors.shadowColor2, fontSize: 12))),
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return CustomButton(
                          isLoading: authController.loginLoading.value,
                          name: 'Sign in',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              authController.loginController(email: emailcontroller.text, password: passwordController.text).then(
                                (value) {
                                  if (value == true) {
                                    Get.to(() => BottomNavigationBarScreen());
                                  }
                                },
                              );
                            }
                            print('no');
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
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01),
                      child: Text('Or With', style: AppTextstyles.simpleText().copyWith(color: AppColors.shadowColor2, fontSize: 14)),
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
                  height: mediaQuerySize.height * 0.02.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/google3.png',
                      ),
                      SizedBox(
                        width: mediaQuerySize.width * 0.02.w,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/fb.png',
                      ),
                      SizedBox(
                        width: mediaQuerySize.width * 0.02.w,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/appl_img.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.015.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('If you dont have account', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.shadowColor2, fontSize: 14)),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignupScreen());
                        },
                        child: Text('Sign Up', style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.amberColor, fontSize: 14)))
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Container(
                  width: mediaQuerySize.width * 0.9.w,
                  height: mediaQuerySize.height * 0.07.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.buttonColor),
                  ),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => BottomNavigationBarScreen());
                        },
                        child: Text(
                          'Sign in as Guest',
                          style: AppTextstyles.simpleTextMedium().copyWith(color: AppColors.buttonColor),
                        )),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
