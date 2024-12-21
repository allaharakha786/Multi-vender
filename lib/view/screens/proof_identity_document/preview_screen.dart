import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

import '../../widgets/countery_picker_widget.dart';
import '../../widgets/custom_circle.dart';
import '../../widgets/social_mediaicon_widget.dart';
import '../../widgets/terms_contdition_widget.dart';
import '../../widgets/upload_document_widget.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

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
              ArrowBackButton(),
              SizedBox(height: mediaQuerySize.height*0.05.h,),
              OnboardingDots(currentIndex: 2,),
               SizedBox(height: mediaQuerySize.height*0.03.h,),
            Center(child: Text('Preview ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),)),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Front side',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.6)),)),
            SizedBox(height: mediaQuerySize.height*0.02.h,), 
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: mediaQuerySize.height*0.2.h,
              width: mediaQuerySize.width*.7.w,
              decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
               image: DecorationImage(image: AssetImage('assets/images/preview_image.png',),fit: BoxFit.cover)
              ),
            ),
             SizedBox(height: mediaQuerySize.height*0.03.h,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Back side',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.6)),)),         
                SizedBox(height: mediaQuerySize.height*0.03.h,),   
          UploadDocumentWidget(text: 'File Upload ',icon: Icons.upload_file,),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           Align(
            alignment: Alignment.centerLeft,
            child: Text('Character Certificate',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.6)),)),         
                SizedBox(height: mediaQuerySize.height*0.03.h,),   
          UploadDocumentWidget(text: 'File Upload ',icon: Icons.upload_file,),
          SizedBox(height: mediaQuerySize.height*0.04.h,),
           CustomButton(name: 'Upload'),
           SizedBox(height: mediaQuerySize.height*0.05.h,),
        // UploadFromGallery(),
          
                  
            
            ],
          ),
                  )),
      ),
    );
  }
}