import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';


class SuccessfullyLogin extends StatelessWidget {
  const SuccessfullyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Column(
          children: [
        
          
          SizedBox(height: mediaQuerySize.height*0.06.h,),
           Center(child: Text('Successfully',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Color(0xff4D4D4D)),)),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
             child: Center(
               child: Text('Your password has been updated, please change your password regularly to avoid this happening ',
               style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
             ),
           ),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
          
             CustomButton(name: 'Continue',  width: mediaQuerySize.width*0.9,),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
           TextButton(onPressed: (){},
                     child: Text('Back to Login',style: TextStyle(color: Color(0xffFFCC00),fontSize: 16,fontWeight: FontWeight.bold),)),

          ],
        ),
      )),
    );
  }
}