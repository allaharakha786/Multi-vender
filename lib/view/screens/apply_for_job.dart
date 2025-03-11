import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/screens/bottom_navigation_bar.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class ApplyForJobScreen extends StatefulWidget {
  int id;
  ApplyForJobScreen({super.key, required this.id});

  @override
  State<ApplyForJobScreen> createState() => _ApplyForJobScreenState();
}

class _ApplyForJobScreenState extends State<ApplyForJobScreen> {
  RxBool isEdit = false.obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void initState() {
    super.initState();
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
                  : Form(
                      key: formKey,
                      child: Column(
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
                                'Apply for Job',
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
                                    CustomField(
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill this field';
                                        }
                                        return null;
                                      },
                                      controller: amountController,
                                      text: 'Amount',
                                    ),
                                    SizedBox(
                                      height: mediaQuerySize.height * 0.02,
                                    ),
                                    CustomField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill this field';
                                        }
                                        return null;
                                      },
                                      controller: messageController,
                                      maxLines: 3,
                                      text: 'Message',
                                    ),
                                    SizedBox(
                                      height: mediaQuerySize.height * 0.035,
                                    ),
                                    Obx(() {
                                      return CustomButton(
                                          isLoading: authController.applyJobIsLoading.value,
                                          name: 'Submit',
                                          onTap: () async {
                                            if (formKey.currentState!.validate()) {
                                              return authController.applyForJobController(amount: amountController.text, message: messageController.text, id: widget.id).then(
                                                (value) {
                                                  if (value == true) {
                                                    Get.to(BottomNavigationBarScreen());
                                                  }
                                                },
                                              );
                                            }
                                          });
                                    })
                                  ],
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
          ),
        ));
  }
}
