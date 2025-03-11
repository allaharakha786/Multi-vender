import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/auth_apis/auth_apis.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/circle_checkbox_text.dart';
import 'package:multi_vender/view/widgets/common_profile_widget.dart';

class ProfileScreenDoer extends StatefulWidget {
  const ProfileScreenDoer({super.key});

  @override
  State<ProfileScreenDoer> createState() => _ProfileScreenDoerState();
}

class _ProfileScreenDoerState extends State<ProfileScreenDoer> {
  RxBool isEdit = false.obs;
  TextEditingController? nameController;
  TextEditingController? skillController;
  TextEditingController? locationController;

  void initState() {
    callMehtods();
    super.initState();
  }

  callMehtods() async {
    await authController.getProfileDataController();
    locationController = TextEditingController(text: authController.profileDataList.value.address);
    nameController = TextEditingController(text: authController.profileDataList.value.fullName);
    skillController = TextEditingController(text: authController.profileDataList.value.skillTitle);
    await authController.getjobPosterController();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: mediaQuerySize.height,
            width: mediaQuerySize.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [AppColors.buttonColor, Color.fromARGB(78, 18, 28, 16)],
            )),
            child: Obx(() {
              return authController.profileLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ))
                  : Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03, horizontal: mediaQuerySize.width * 0.04),
                              child: ArrowBackButton(
                                backgroundColor: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(
                              width: mediaQuerySize.width * 0.14.w,
                            ),
                            Text(
                              'My Profile',
                              style: AppTextstyles.simpleTextBold(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.01.h, // mediaQuerySize.height * 0.05.h,
                        ),
                        Expanded(
                          child: Container(
                            width: mediaQuerySize.width.w,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                            child: SingleChildScrollView(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.035, vertical: mediaQuerySize.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return ProfileCommonWidget(
                                      isLoading: authController.isProfileUpdateLoading,
                                      nameController: nameController ?? TextEditingController(),
                                      skillController: skillController ?? TextEditingController(),
                                      onTap: () {
                                        isEdit.value = !isEdit.value;
                                        if (!isEdit.value) {
                                          authController.updateProfileController(imagePath: authController.imagePathh.value, fullName: nameController?.text ?? '', skillTitle: skillController?.text ?? '', address: locationController?.text ?? '');

                                          print(authController.imagePathh.value);
                                          print(nameController?.text ?? '');
                                          print(skillController?.text ?? '');
                                          print(locationController?.text ?? '');
                                        }
                                      },
                                      isEdit: isEdit.value.obs,
                                      name: authController.profileDataList.value.fullName,
                                      address: authController.profileDataList.value.address,
                                      jobTitle: authController.profileDataList.value.skillTitle,
                                      imagePath: authController.profileDataList.value.image,
                                    );
                                  }),
                                  Text(
                                    'Verification',
                                    style: AppTextstyles.simpleText().copyWith(fontSize: 14, color: AppColors.blackColor, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  CircleCheckBox(text: 'CNIC Verified', isChecked: true.obs),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  CircleCheckBox(
                                    text: 'Police Clearance Verified',
                                    isChecked: true.obs,
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.05.h,
                                  ),
                                  Text('Location', style: AppTextstyles.simpleText().copyWith(fontSize: 14, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('📍 '),
                                      SizedBox(
                                          width: mediaQuerySize.width * 0.7,
                                          child: TextFormField(
                                            style: TextStyle(color: AppColors.blackColor),
                                            readOnly: isEdit.value ? false : true,
                                            controller: locationController,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                                              border: InputBorder.none,
                                              hintText: 'Enter your address',
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  Text('Posted Tasks', style: AppTextstyles.simpleText().copyWith(fontSize: 14, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  Column(
                                    children: List.generate(
                                      authController.jobsPosterDataList.value.totalJobsPosted,
                                      (index) {
                                        var data = authController.jobsPosterDataList.value;
                                        return Padding(
                                          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.0085.h, horizontal: mediaQuerySize.width * 0.01.w),
                                          child: Container(
                                            width: mediaQuerySize.width,
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      spreadRadius: 0.4,
                                                      blurRadius: 3,
                                                      blurStyle: BlurStyle.outer,
                                                      offset: Offset(
                                                        0,
                                                        0.2,
                                                      )),
                                                ],
                                                borderRadius: BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.025.h),
                                              child: Column(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.topRight,
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        color: AppColors.blackColor54,
                                                      )),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: mediaQuerySize.height * 0.15.h,
                                                        width: mediaQuerySize.width * 0.25,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(15),
                                                            image: DecorationImage(fit: BoxFit.cover, image: data.jobs[index].image == null ? AssetImage('assets/images/recomended_service_image.png') : NetworkImage("https://www.talhaproject.com${data.jobs[index].image}"))),
                                                      ),
                                                      SizedBox(
                                                        width: mediaQuerySize.width * 0.04,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            data.jobs[index].jobCategory,
                                                            style: AppTextstyles.simpleTextBold().copyWith(color: AppColors.blackColor, fontSize: 13),
                                                          ),
                                                          Text(
                                                            data.jobs[index].title,
                                                            style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.location_on,
                                                                color: AppColors.amberColor,
                                                              ),
                                                              Text(
                                                                data.jobs[index].address,
                                                                style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color: AppColors.amberColor,
                                                              ),
                                                              Text(
                                                                '4.9(28 Reviews)',
                                                                style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ));
  }
}
