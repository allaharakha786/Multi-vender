import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';


import '../../widgets/custom_circle.dart';
import '../../widgets/image_picker_widget.dart';
import '../../widgets/social_mediaicon_widget.dart';
import '../../widgets/terms_contdition_widget.dart';
import '../../widgets/upload_document_widget.dart';

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({super.key});

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
              ArrowBackButton(color: Colors.black.withOpacity(0.07)),
              SizedBox(height: mediaQuerySize.height*0.1.h,),
              OnboardingDots(currentIndex: 1,),
               SizedBox(height: mediaQuerySize.height*0.03.h,),
            Center(child: Text('Verify Your Document',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),)),
            SizedBox(height: mediaQuerySize.height*0.03.h,),
          Center(child: Text('Please upload a clear image of your selected document. Make sure all details are visible.',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            SizedBox(height: mediaQuerySize.height*0.02.h,),          
           ImagePickerWidget(
                  imageSource: ImageSource.gallery,
                  buttonText: "Upload from Gallery",
                  buttonIcon: Icons.upload_file,
                ),
           SizedBox(height: mediaQuerySize.height*0.02.h,),          
           ImagePickerWidget(
                  imageSource: ImageSource.camera,
                  buttonText: "Take a Photo",
                  buttonIcon: Icons.camera_alt_outlined,
                ),
           SizedBox(height: mediaQuerySize.height*0.02.h,),          
           ImagePickerWidget(
                  imageSource: ImageSource.gallery,
                  buttonText: "File Upload",
                  buttonIcon: Icons.upload_file,
                ),
           SizedBox(height: mediaQuerySize.height*0.02.h,),
           CustomButton(  width: mediaQuerySize.width*0.9,name: 'Upload')
        // UploadFromGallery(),
          
                  
            
            ],
          ),
                  )),
      ),
    );
  }
}