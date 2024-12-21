import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

import '../../../widgets/arrow_back_button.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Column(
          children: [
        
           ArrowBackButton(),
          SizedBox(height: mediaQuerySize.height*0.06.h,),
           Center(child: Text('Verify your Email',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           Text('Enter your Email Address to receive ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            SizedBox(height: mediaQuerySize.height*0.01.h,),
           Text('a code. ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
             Customfield(hintText: 'Email',
            validator: (value){
            if(value!.isEmpty){
              return 'please enter your email';
            }
            return null;
            },
            ),
             SizedBox(height: mediaQuerySize.height*0.03.h,),
             CustomButton(name: 'Send Code'),

          ],
        ),
      )),
    );
  }
}