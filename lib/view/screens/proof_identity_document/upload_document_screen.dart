// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../widgets/arrow_back_button.dart';
// import '../../widgets/camer_image.dart';
// import '../../widgets/custom_circle.dart';
// import '../../widgets/image_picker_widget.dart';
// import '../../widgets/custom_button.dart';

// class UploadDocumentScreen extends StatelessWidget {
//   const UploadDocumentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size mediaQuerySize = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Back Button
//                 ArrowBackButton(backgroundColor: Colors.black.withOpacity(0.07)),
//                 SizedBox(
//                   height: mediaQuerySize.height * 0.05.h,
//                 ),
//                 OnboardingDots(
//                   currentIndex: 1,
//                 ),

//                 SizedBox(height: mediaQuerySize.height * 0.05.h),

//                 // Title and Description
//                 Text(
//                   'Verify Your Document',
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: mediaQuerySize.height * 0.02.h),
//                 Text(
//                   'Please upload a clear image of your selected document. Make sure all details are visible.',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: mediaQuerySize.height * 0.03.h),

//                 // Upload from Gallery
//                 ImagePickerWidget(
//                   imageSource: ImageSource.gallery,
//                   buttonText: "Upload from Gallery",
//                   buttonIcon: Icons.upload_file,
//                 ),
//                 SizedBox(height: mediaQuerySize.height * 0.03.h),

//                 // Camera Capture
//                 CameraCaptureWidget(),
//                 SizedBox(height: mediaQuerySize.height * 0.03.h),

//                 // File Upload
//                 ImagePickerWidget(
//                   imageSource: ImageSource.gallery,
//                   buttonText: "File Upload",
//                   buttonIcon: Icons.upload_file,
//                 ),
//                 SizedBox(height: mediaQuerySize.height * 0.03.h),

//                 // Upload Button
//                 CustomButton(
//                   width: mediaQuerySize.width * 0.9,
//                   name: 'Upload',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
