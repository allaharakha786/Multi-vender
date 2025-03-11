//according to this widget am unable to access any image from camera
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';

class ImagePickerWidget extends StatelessWidget {
  AuthController authController = Get.find();

  final ImageSource imageSource;
  final String buttonText;
  final IconData buttonIcon;
  bool isFrontId = false;
  bool isBackId = false;
  bool isCharacterCertificate = false;

  bool isPostJob = false;

  ImagePickerWidget({Key? key, required this.imageSource, required this.buttonText, required this.buttonIcon, this.isFrontId = false, this.isBackId = false, this.isCharacterCertificate = false, this.isPostJob = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    final Rx<File?> selectedImage = Rx<File?>(null);

    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);

        if (isFrontId) {
          authController.idCardFront.value = selectedImage.value!.path;
        }
        if (isBackId) {
          authController.idCardBack.value = selectedImage.value!.path;
        }
        if (isCharacterCertificate) {
          authController.characterCertificate.value = selectedImage.value!.path;
        }

        if (isPostJob) {
          authController.postJobImage.value = selectedImage.value!.path;
        }
        print("${authController.idCardFront.value}, ${authController.idCardBack.value}, ${authController.characterCertificate.value}");
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
          : GestureDetector(
              onTap: pickImage,
              child: Container(
                height: mediaQuerySize.height * 0.11.h,
                width: mediaQuerySize.width * 0.9.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      buttonIcon,
                      color: AppColors.shadowColor2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buttonText,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
