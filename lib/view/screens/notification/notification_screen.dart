import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/screens/notification/notification_screen2.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [AppColors.buttonColor, Color.fromARGB(78, 18, 28, 16)],
            )),
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
                      'Notifications',
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => NotificationScreen2());
                            },
                            child: Card(
                              surfaceTintColor: Colors.white,
                              color: Colors.white,
                              margin: EdgeInsets.all(10),
                              elevation: 5,
                              child: ListTile(
                                leading: Image.asset("assets/images/ic_notify.png"),
                                title: Text(
                                  "Job Complete",
                                ),
                                subtitle: Text("UI/Ux Web Designer"),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Icon(Icons.more_vert), Text("25 min")],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_calendar.png"),
                              title: Text(
                                "Reminder",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_mail.png"),
                              title: Text(
                                "New Message",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_mail.png"),
                              title: Text(
                                "New Message",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_mail.png"),
                              title: Text(
                                "New Message",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_mail.png"),
                              title: Text(
                                "New Message",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_mail.png"),
                              title: Text(
                                "New Message",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_mail.png"),
                              title: Text(
                                "New Message",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_notify.png"),
                              title: Text(
                                "Jhon Smith",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("25 min")],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
