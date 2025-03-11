import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/screens/choose_payment_method.dart';
import 'package:multi_vender/view/screens/choose_account.dart';
import 'package:multi_vender/view/screens/poster_home_screen.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/common_widgets.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';
import 'package:multi_vender/view/widgets/image_picker_widget.dart';

class JobInformation extends StatelessWidget {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController paymentTypeController = TextEditingController();
  TextEditingController skillRequirementsController = TextEditingController();
  TextEditingController jobCategoryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  JobInformation({super.key});

  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: mediaQuerySize.height.h,
          width: mediaQuerySize.width.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [AppColors.buttonColor, Color.fromARGB(78, 18, 28, 16)],
          )),
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03, horizontal: mediaQuerySize.width * 0.04),
                  child: ArrowBackButton(
                    backgroundColor: AppColors.whiteColor,
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Expanded(
                  child: Container(
                    // height: mediaQuerySize.height,
                    width: mediaQuerySize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.025.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: mediaQuerySize.height * 0.03.h,
                            ),
                            Text(
                              'Job Information',
                              style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor),
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              text: 'Job Title',
                              isPrefixIcon: false,
                              controller: jobTitleController,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.013.h,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              controller: skillRequirementsController,
                              text: 'Skill Requirements',
                              isPrefixIcon: false,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.013.h,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              controller: jobCategoryController,
                              text: 'Job Category',
                              isPrefixIcon: false,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.013.h,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              controller: amountController,
                              text: 'Amount',
                              isPrefixIcon: false,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.013.h,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              controller: paymentTypeController,
                              text: 'Payment Type',
                              isPrefixIcon: false,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.013.h,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              controller: addressController,
                              text: 'Address',
                              isPrefixIcon: false,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.013.h,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                              controller: jobDescriptionController,
                              text: 'Job Description',
                              isPrefixIcon: false,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.025.h,
                            ),
                            ImagePickerWidget(
                              isPostJob: true,
                              imageSource: ImageSource.gallery,
                              buttonText: "Upload from Gallery",
                              buttonIcon: Icons.upload_file,
                            ),
                            SizedBox(
                              height: mediaQuerySize.height * 0.025.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    return CustomButton(
                                        isLoading: authController.isPostJobLoading.value,
                                        onTap: () async {
                                          if (globalKey.currentState!.validate()) {
                                            authController
                                                .postJobController(
                                                    imagePath: authController.postJobImage.value,
                                                    jobTitle: jobTitleController.text,
                                                    skillRequirements: skillRequirementsController.text,
                                                    jobCategory: jobCategoryController.text,
                                                    amount: amountController.text,
                                                    paymentType: paymentTypeController.text,
                                                    address: addressController.text,
                                                    jobDescription: jobDescriptionController.text)
                                                .then(
                                              (value) {
                                                if (value == true) {
                                                  Get.to(() => PosterHomeScreen());
                                                }
                                              },
                                            );
                                          }

                                          // Get.to(() => ChoosePaymentMethod());
                                        },
                                        name: 'Post a Job');
                                  }),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
