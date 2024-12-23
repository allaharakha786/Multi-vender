import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/password_controller.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

import '../../widgets/custom_circle.dart';
import '../../widgets/social_mediaicon_widget.dart';
import '../../widgets/terms_contdition_widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  PasswordController passwordController = Get.put(PasswordController());

  Country? _selectedCountry;
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                )),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  text: 'Full Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the following field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  text: 'Phone Number',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the following field';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  text: 'country',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the following field';
                    }
                    return null;
                  },
                  isSuffixIcon: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true, // Show country code
                        onSelect: (Country country) {
                          setState(() {
                            _selectedCountry = country;
                          });
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Ensures the Row fits within the suffixIcon constraints
                      children: [
                        Text(
                          _selectedCountry != null ? "${_selectedCountry!.flagEmoji} +${_selectedCountry!.phoneCode}" : "Select",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    ),
                  ),
                ),

                //  CountryPickerContainer(),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  text: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the following field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
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
                        passwordController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: passwordController.togglePasswordVisibility,
                    ),
                  ),
                ),

                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                TermsAndConditionsText(),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomButton(
                  name: 'Sign up as Posters',
                  onTap: () {
                    if (formKey.currentState!.validate() ?? false) {
                      print('yes');
                    }
                    print('no');
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or With',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/google3.png',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/fb.png',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/appl_img.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  children: [
                    Text(
                      ' Already have an account?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Color(0xffFFCC00), fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
