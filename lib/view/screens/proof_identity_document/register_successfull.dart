import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/view/screens/authentication/sign_in_screen.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';

import 'package:multi_vender/view/widgets/custom_button.dart';

class RegisterSuccessfull extends StatelessWidget {
  const RegisterSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaQuerySize.height * 0.1.h,
            ),
            Center(
              child: Container(
                height: mediaQuerySize.height * 0.15.h,
                width: mediaQuerySize.width * 0.2.w,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Vector.png'))),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Text(
              'Registration Successful!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xff4D4D4D)),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.008.h,
            ),
            Text(
              'Your account is awaiting admin approval. You will receive a notification once your profile is activated. ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            CustomButton(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                width: mediaQuerySize.width * 0.9,
                name: 'Continue'),
          ],
        ),
      )),
    );
  }
}
