

//according to this widget am unable to access any image from camera  
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final ImageSource imageSource;
  final String buttonText;
  final IconData buttonIcon;

  ImagePickerWidget({
    Key? key,
    required this.imageSource,
    required this.buttonText,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size mediaQuerySize = MediaQuery.of(context).size;
    final Rx<File?> selectedImage = Rx<File?>(null);

    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    }

    return Obx(() {
      return selectedImage.value != null
          ? Container(
                        margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: mediaQuerySize.height * 0.2.h,
                    width: mediaQuerySize.width * 0.7.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(selectedImage.value!),
                  fit: BoxFit.cover,
                ),
              ),
            )
            :GestureDetector(
              onTap: pickImage,
              child: Container(
            height: mediaQuerySize.height*0.11.h,
            width: mediaQuerySize.width*0.9.w,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(buttonIcon,color: Colors.grey,),
                const SizedBox(width: 8),
                Text(buttonText,style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
            );
          // : ElevatedButton.icon(
          //     onPressed: pickImage,
          //     icon: Icon(buttonIcon),
          //     label: Text(buttonText),
          //   );
    });
  }
}






// // In this Code i'm facing Permission error :
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // class ImagePickerWidget extends StatelessWidget {
// //   final ImageSource imageSource;
// //   final String buttonText;
// //   final IconData buttonIcon;

// //   ImagePickerWidget({
// //     Key? key,
// //     required this.imageSource,
// //     required this.buttonText,
// //     required this.buttonIcon,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     Size mediaQuerySize = MediaQuery.of(context).size;
// //     final Rx<File?> selectedImage = Rx<File?>(null);

// //     Future<void> pickImage() async {
// //       // Check and request permissions
// //       if (imageSource == ImageSource.camera) {
// //         // Check camera permission
// //         PermissionStatus cameraStatus = await Permission.camera.request();
// //         if (cameraStatus.isGranted) {
// //           final pickedFile = await ImagePicker().pickImage(source: imageSource);
// //           if (pickedFile != null) {
// //             selectedImage.value = File(pickedFile.path);
// //           }
// //         } else {
// //           Get.snackbar("Permission Denied", "Camera access is required to take photos.",
// //               snackPosition: SnackPosition.BOTTOM);
// //         }
// //       } else if (imageSource == ImageSource.gallery) {
// //         // Check gallery permission
// //         PermissionStatus galleryStatus = await Permission.photos.request();
// //         if (galleryStatus.isGranted) {
// //           final pickedFile = await ImagePicker().pickImage(source: imageSource);
// //           if (pickedFile != null) {
// //             selectedImage.value = File(pickedFile.path);
// //           }
// //         } else {
// //           Get.snackbar("Permission Denied", "Gallery  access is required to select photos.",
// //               snackPosition: SnackPosition.BOTTOM);
// //         }
// //       }
// //     }

// //     return Obx(() {
// //       return selectedImage.value != null
// //           ? Container(
// //               margin: const EdgeInsets.all(10),
// //               padding: const EdgeInsets.all(10),
// //               height: mediaQuerySize.height * 0.2.h,
// //               width: mediaQuerySize.width * 0.7.w,
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10),
// //                 image: DecorationImage(
// //                   image: FileImage(selectedImage.value!),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             )
// //           : GestureDetector(
// //               onTap: pickImage,
// //               child: Container(
// //                 height: mediaQuerySize.height * 0.11.h,
// //                 width: mediaQuerySize.width * 0.9.w,
// //                 decoration: BoxDecoration(
// //                   color: Colors.black.withOpacity(0.07),
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Icon(buttonIcon, color: Colors.grey),
// //                     const SizedBox(width: 8),
// //                     Text(
// //                       buttonText,
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //     });
// //   }
// // }
