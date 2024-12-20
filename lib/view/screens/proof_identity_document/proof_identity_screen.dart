import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../widgets/arrow_back_button.dart';
import '../../widgets/circle_checkbox_text.dart';
import '../../widgets/custom_button.dart';


class ProofIdentityScreen extends StatelessWidget {
  const ProofIdentityScreen({super.key});

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
           Center(child: Text('Proof of Identity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
             child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Select document type',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),textAlign:TextAlign.start,)),
           ),
           
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15),
             child: Text('Choose the type of document you would like to upload for verification. ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
           ),
            SizedBox(height: mediaQuerySize.height*0.02.h,),
             CircleCheckBox(text: 'Email Address',),
              SizedBox(height: mediaQuerySize.height*0.02.h,),
             CircleCheckBox(text: 'National ID',),
              SizedBox(height: mediaQuerySize.height*0.02.h,),
             CircleCheckBox(text: 'Character Certificate',),
              SizedBox(height: mediaQuerySize.height*0.05.h,),
            
             
             CustomButton(name: 'Confirm'),
         SizedBox(height: mediaQuerySize.height*0.03.h,),
        
            

          ],
        ),
      )),
    );
  }
 
}