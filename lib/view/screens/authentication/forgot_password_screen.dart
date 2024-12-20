import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Column(
          children: [
        
          
          SizedBox(height: mediaQuerySize.height*0.06.h,),
           Center(child: Text('Forgot Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           Text('Enter your Email Address to receive ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            SizedBox(height: mediaQuerySize.height*0.01.h,),
           Text('a password reset link. ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
            CustomField(text: 'Email'),
             SizedBox(height: mediaQuerySize.height*0.03.h,),
             CustomButton(name: 'Send Reset Link'),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Remember Password?',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Text('  Back to',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold)),
                    TextButton(onPressed: (){},
                     child: Text('Log in',style: TextStyle(color: Color(0xffFFCC00),fontSize: 16,fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            )

          ],
        ),
      )),
    );
  }
}