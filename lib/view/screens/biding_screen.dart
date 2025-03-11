import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/authentication/login_screen.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';

class BidingScreen extends StatefulWidget {
  const BidingScreen({super.key});

  @override
  State<BidingScreen> createState() => _BidingScreenState();
}

class _BidingScreenState extends State<BidingScreen> {
  RxBool isEdit = false.obs;
  TextEditingController? nameController;
  TextEditingController? skillController;
  TextEditingController? locationController;

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
                              'Biding',
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
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02,
                                  ),
                                  Column(
                                    children: List.generate(
                                      10,
                                      (index) => commonBidingWidget(mediaQuerySize: mediaQuerySize),
                                    ),
                                  ),
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

  Widget commonBidingWidget({required Size mediaQuerySize, String? imagePath, String? amount, String? description, String? date, String? status}) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: mediaQuerySize.height * 0.13,
              width: mediaQuerySize.width * 0.2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imagePath ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s"))),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      status ?? 'Accepted',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
                Text(
                  '${amount ?? "\$60.00"}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${description ?? "I can complete this job within 3 days."}',
                  style: TextStyle(color: AppColors.blackColor54),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '${date ?? '2/17/2025, 8:38:39 AM'}',
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
