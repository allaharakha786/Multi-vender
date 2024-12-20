import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/custom_button.dart';


class VeriCodeScreen extends StatelessWidget {
  const VeriCodeScreen({super.key});

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
           Center(child: Text('Verification Code',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           Text('Enter your Email Address to receive ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            SizedBox(height: mediaQuerySize.height*0.01.h,),
           Text('email address. ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildVerificationBox('8'),
                SizedBox(width: mediaQuerySize.width*0.03.h,),
                _buildVerificationBox('5'),
                SizedBox(width: mediaQuerySize.width*0.03.h,),
                _buildVerificationBox('2'),
                SizedBox(width: mediaQuerySize.width*0.03.h,),
                _buildVerificationBox(''),
              ],
             ) ,
            
             SizedBox(height: mediaQuerySize.height*0.03.h,),
             CustomButton(name: 'Confirm'),
         SizedBox(height: mediaQuerySize.height*0.03.h,),
            

          ],
        ),
      )),
    );
  }
  Widget _buildVerificationBox(String value) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: value.isEmpty ? Colors.black : Colors.grey, // Empty box is black, filled is blue
          ),
        ),
      ),
    );
  }
}
