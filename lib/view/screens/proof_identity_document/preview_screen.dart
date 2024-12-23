


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_circle.dart';
import '../../widgets/image_picker_widget.dart';
import '../../widgets/arrow_back_button.dart';
import '../../widgets/custom_button.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Column(
              children: [
                 ArrowBackButton(color: Colors.black.withOpacity(0.07)),
                SizedBox(height: mediaQuerySize.height * 0.05.h),

                                OnboardingDots(currentIndex: 2),
                                 SizedBox(height: mediaQuerySize.height * 0.05.h),
                Center(
                  child: Text(
                    'Preview',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Front side',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                ImagePickerWidget(
                  imageSource: ImageSource.gallery,
                  buttonText: "File Upload",
                  buttonIcon: Icons.upload_file,
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Back side',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                ImagePickerWidget(
                  imageSource: ImageSource.camera,
                  buttonText: "File Upload",
                  buttonIcon: Icons.upload_file,
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Character Certificate',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                ImagePickerWidget(
                  imageSource: ImageSource.gallery,
                  buttonText: "File Upload",
                  buttonIcon: Icons.upload_file,
                ),
                SizedBox(height: mediaQuerySize.height * 0.05.h),
                 CustomButton(  width: mediaQuerySize.width*0.9,name: 'Upload'),
                SizedBox(height: mediaQuerySize.height * 0.08.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

