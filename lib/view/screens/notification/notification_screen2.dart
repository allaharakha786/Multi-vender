import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';
import 'package:multi_vender/view/widgets/arrow_back_button.dart';

import '../../../controllers/utils/app_colors.dart';

class NotificationScreen2 extends StatelessWidget {
  const NotificationScreen2({super.key});

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
                  height: mediaQuerySize.height * 0.01.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Reminder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: mediaQuerySize.width.w,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/pic1.png"),
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
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/pic2.png"),
                              title: Text(
                                "Jhon Smith",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("Today,10:50 am")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/pic1.png"),
                              title: Text(
                                "Jhon Smith",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("Today,10:50 am")],
                              ),
                            ),
                          ),
                          Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset("assets/images/pic2.png"),
                              title: Text(
                                "Jhon Smith",
                              ),
                              subtitle: Text("UI/Ux Web Designer"),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.more_vert), Text("Today,10:50 am")],
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
