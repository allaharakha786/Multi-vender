import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/custom_user_widget.dart';

class NotificationScreen2 extends StatelessWidget {
  const NotificationScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 40,
                width: 40,
                // height: mediaQuerySize.height*0.1.h,
                // width: mediaQuerySize.width*0.06.w,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                    ))),
          ),
          title: Text(
            "Notification",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          color: Color(0xFF115740),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF115740),
                Color.fromARGB(158, 255, 255, 255),
              ], begin: Alignment.centerLeft, end: Alignment.topRight),
              // gradient: LinearGradient(
              //   colors: [
              //     Color(0xff115740),
              //     Colors.white,
              //   ],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120, // mediaQuerySize.height * 0.05.h,
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: mediaQuerySize.height.h,
                    width: mediaQuerySize.width.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
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
                              children: [
                                Icon(Icons.more_vert),
                                Text("Today,10:50 am")
                              ],
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
                              children: [
                                Icon(Icons.more_vert),
                                Text("Today,10:50 am")
                              ],
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
                              children: [
                                Icon(Icons.more_vert),
                                Text("Today,10:50 am")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
