import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class ProfileCommonWidget extends StatefulWidget {
  String? name;
  String? rating;
  String? jobTitle;
  String? address;
  String? imagePath;
  RxBool? isEdit;
  RxBool isLoading;
  TextEditingController nameController;
  TextEditingController skillController;

  dynamic Function()? onTap;

  ProfileCommonWidget({super.key, this.name, this.rating, this.jobTitle, this.address, this.imagePath, this.onTap, this.isEdit, required this.nameController, required this.skillController, required this.isLoading});

  AuthController authController = Get.find();
  @override
  State<ProfileCommonWidget> createState() => _ProfileCommonWidgetState();
}

class _ProfileCommonWidgetState extends State<ProfileCommonWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Obx(() {
      return SizedBox(
        width: mediaQuerySize.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: mediaQuerySize.height * 0.15,
              width: mediaQuerySize.width * 0.25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: authController.imagePathh.value.isNotEmpty
                          ? FileImage(File(authController.imagePathh.value))
                          : NetworkImage(widget.imagePath?.isEmpty ?? false ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&s" : "https://www.talhaproject.com${widget.imagePath}")),
                  shape: BoxShape.circle),
              child: GestureDetector(
                onTap: () {
                  if (widget.isEdit!.value) {
                    pickImage();
                  }
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: mediaQuerySize.height * 0.065,
                    width: mediaQuerySize.width * 0.085,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.buttonColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/svg/photo-camera-add.svg'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: mediaQuerySize.width * 0.03,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    readOnly: widget.isEdit!.value ? false : true,
                    controller: widget.nameController,
                    style: AppTextstyles.simpleText().copyWith(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 1), // Removes top & bottom padding
                      border: InputBorder.none,
                      hintText: 'Enter your name',
                    ),
                  ),
                  Text(
                    '★ ${widget.rating ?? '4.8 (120 Reviews)'}',
                    style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: Colors.amber, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    readOnly: widget.isEdit!.value ? false : true,
                    controller: widget.skillController,
                    style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor54),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 1), // Removes top & bottom padding
                      border: InputBorder.none,
                      hintText: 'Enter your skill',
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.01,
                  ),
                  CustomButton(
                    isLoading: widget.isLoading.value,
                    onTap: widget.onTap,
                    name: widget.isEdit!.value ? 'Save' : 'Edit',
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      authController.imagePathh.value = pickedFile.path;
      print('My image path is: ${authController.imagePathh.value}');
    }
  }
}
