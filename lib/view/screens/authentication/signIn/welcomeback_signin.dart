import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

import '../../../widgets/social_mediaicon_widget.dart';


class WelcomebackSignin extends StatelessWidget {
  const WelcomebackSignin({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
          child: Column(
            children: [
          
             
               SizedBox(height: mediaQuerySize.height*0.08.h,),
            Center(child: Text('Welcome Back',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),)),
            SizedBox(height: mediaQuerySize.height*0.02.h,),
          
         
             
             SizedBox(height: mediaQuerySize.height*0.03.h,),
             CustomField(text: 'Email'), 
                  SizedBox(height: mediaQuerySize.height*0.03.h,),
             CustomField(text: 'Password',suffixIcon: Icons.visibility_off_outlined,), 
                  SizedBox(height: mediaQuerySize.height*0.03.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(children: [
                      Icon(Icons.circle_outlined,size: 20,),
                      SizedBox(width: 5,),
                      Text('Remember Password',style: TextStyle(color: Colors.grey,fontSize: 13),),
                     ],),
                       TextButton(onPressed: (){},
                        child: Text('Forget Password?',style: TextStyle(color: Colors.grey,fontSize: 13))),
                    ],
                  ),
                 
         
          SizedBox(height: mediaQuerySize.height*0.03.h,),
          CustomButton(name: 'Sign in'),
          SizedBox(height: mediaQuerySize.height*0.03.h,),
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
          SizedBox(height: mediaQuerySize.height*0.02.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaIconsRow(imgUrl: 'assets/images/google3.png',),
                SizedBox(width: 15,),
                SocialMediaIconsRow(imgUrl: 'assets/images/fb.png',),
                
          SizedBox(width: 15,),
                SocialMediaIconsRow(imgUrl: 'assets/images/appl_img.png',),
              ],
            ),
          ),
          SizedBox(height: mediaQuerySize.height*0.015.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('If you dont have account',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey),),
            TextButton(onPressed: (){},
             child: Text('Sign Up',style: TextStyle(color: Color(0xffFFCC00),fontSize: 18,fontWeight: FontWeight.bold),))
          ],),
      SizedBox(height: mediaQuerySize.height*0.03.h,),
          Container(
           width: mediaQuerySize.width*0.9.w,
           height: mediaQuerySize.height*0.07.h, 
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xff115740)),
           ),
           child: Center(
            child: TextButton(onPressed: (){},
             child: Text('Sign in as Guest',style: TextStyle(color:Color(0xff115740),fontSize: 14,fontWeight: FontWeight.bold ),)),
           ),
          )
          
          
                  
            
            ],
          ),
                  )),
      ),
    );
  }
}