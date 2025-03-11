import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/chat/chat_conversation.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';
import 'package:multi_vender/view/widgets/customField.dart';

class ChatInbox extends StatelessWidget {
  const ChatInbox({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: mediaQuerySize.height.h,
        width: mediaQuerySize.width.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.buttonColor,
          AppColors.shadowColor2,
        ])),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.02.h),
              child: Row(
                children: [
                  ArrowBackButton(
                    arrowColor: AppColors.whiteColor,
                    backgroundColor: AppColors.shadowColor2,
                  ),
                  SizedBox(width: mediaQuerySize.width * 0.3.w),
                  Text(
                    "Chat ",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuerySize.width * 0.06.w,
              ),
              child: CustomField(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.blackColor54,
                ),
                isPrefixIcon: true,
                text: 'Search for doers',
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            Expanded(
              child: Container(
                width: mediaQuerySize.width.w,
                decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mediaQuerySize.height * 0.04.h,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                10,
                                (index) => buildUserRounded(
                                  "assets/images/Ellipse 19.png",
                                  () {
                                    Get.to(() => ChatScreen());
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.015.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: mediaQuerySize.width * 0.025.w),
                          child: Text(
                            "Messages",
                            style: AppTextstyles.simpleText().copyWith(fontSize: 14, color: AppColors.lightBlackColor),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                            children: List.generate(
                          10,
                          (index) => buildInboxListTile("assets/images/Ellipse 20.png"),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  buildInboxListTile(String pic) {
    return Card(
      surfaceTintColor: AppColors.whiteColor,
      color: AppColors.whiteColor,
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(pic),
          radius: 25,
        ),
        title: Text(
          "Jhon Smith",
          style: AppTextstyles.simpleText().copyWith(fontSize: 14, color: AppColors.blackColor),
        ),
        subtitle: Text(
          "Lorem ipsum text here",
          style: AppTextstyles.simpleText().copyWith(fontSize: 12, color: AppColors.blackColor),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "25 min",
              style: AppTextstyles.simpleText().copyWith(fontSize: 10, color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }

  static buildUserRounded(String pic, void Function()? onTap) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(pic),
                //  NetworkImage(
                //   "https://via.placeholder.com/150",
                // ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.whiteColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
