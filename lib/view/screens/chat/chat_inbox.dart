import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/custom_user_widget.dart';

class ChatInbox extends StatelessWidget {
  const ChatInbox({super.key});

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
          leading: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 40,
                  width: 40,
                  // height: mediaQuerySize.height*0.1.h,
                  // width: mediaQuerySize.width*0.06.w,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                      ))),
            ),
          ),
          title: Text(
            "Chat",
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
            child: ListView(
              children: [
                // SizedBox(
                //   height: 100,
                // ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for Doers..",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              buildUserRounded("assets/images/Ellipse 19.png"),
                              buildUserRounded("assets/images/Ellipse 20.png"),
                              buildUserRounded("assets/images/Ellipse 21.png"),
                              buildUserRounded("assets/images/Ellipse 19.png"),
                              buildUserRounded("assets/images/Ellipse 20.png"),
                              buildUserRounded("assets/images/Ellipse 21.png"),
                              buildUserRounded("assets/images/Ellipse 19.png"),
                              buildUserRounded("assets/images/Ellipse 20.png"),
                              buildUserRounded("assets/images/Ellipse 21.png"),
                              buildUserRounded("assets/images/Ellipse 19.png"),
                              buildUserRounded("assets/images/Ellipse 20.png"),
                              buildUserRounded("assets/images/Ellipse 21.png"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Messages",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: ListView(
                          children: [
                            buildInboxListTile("assets/images/Ellipse 20.png"),
                            buildInboxListTile("assets/images/Ellipse 21.png"),
                            buildInboxListTile("assets/images/Ellipse 19.png"),
                            buildInboxListTile("assets/images/Ellipse 20.png"),
                            buildInboxListTile("assets/images/Ellipse 21.png"),
                            buildInboxListTile("assets/images/Ellipse 19.png"),
                            buildInboxListTile("assets/images/Ellipse 20.png"),
                            buildInboxListTile("assets/images/Ellipse 21.png"),
                            buildInboxListTile("assets/images/Ellipse 19.png")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  buildInboxListTile(String pic) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(pic),
          radius: 25,
        ),
        // Container(
        //   width: 50,
        //   height: 50,
        //   margin: EdgeInsets.symmetric(horizontal: 5),
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       image: AssetImage(pic),
        //       //  NetworkImage(
        //       //   "https://via.placeholder.com/150",
        //       // ),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        title: Text(
          "Jhon Smith",
        ),
        subtitle: Text("Lorem ipsum text here"),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("25 min")],
        ),
      ),
    );
  }

  static buildUserRounded(String pic) {
    return Stack(
      children: [
        Container(
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
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
