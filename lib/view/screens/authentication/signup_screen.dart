import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/customField.dart';

import '../../widgets/countery_picker_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            SizedBox(height: mediaQuerySize.height*0.15.h,),
          Center(child: Text('Create Your Account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),)),
          SizedBox(height: mediaQuerySize.height*0.03.h,),
          Customfield(text: 'Full Name',),
          SizedBox(height: mediaQuerySize.height*0.03.h,),
          Customfield(text: 'Phone Number',),
          SizedBox(height: mediaQuerySize.height*0.03.h,),
     CountryPickerContainer()        
          ],
        ),
      )),
    );
  }
}