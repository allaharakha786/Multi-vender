import 'package:flutter/material.dart';
import 'package:multi_vender/view/screens/chat/chat_inbox.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      "isSentByMe": false,
      "message": "Hi there! How can I help you?",
      "time": "10:30 AM",
      "userPic": "assets/sender.jpg", // Replace with your asset image
    },
    {
      "isSentByMe": true,
      "message": "I need some information about your services.",
      "time": "10:31 AM",
    },
    {
      "isSentByMe": false,
      "message": "Sure! What would you like to know?",
      "time": "10:32 AM",
      "userPic": "assets/sender.jpg", // Replace with your asset image
    },
  ];
  final TextEditingController messageController = TextEditingController(); // For input

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          "isSentByMe": true,
          "message": messageController.text.trim(),
          "time": "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour < 12 ? 'AM' : 'PM'}",
        });
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                    ))),
          ),
        ),
        title: Row(
          children: [
            ChatInbox.buildUserRounded(
              "assets/images/Ellipse 20.png",
              () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jhon Smith",
                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
        actions: [
          Container(
              child: Icon(
            Icons.call_outlined,
            color: Colors.white,
          )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              )),
        ],
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
          child: Container(
            margin: EdgeInsets.only(top: 130),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true, // Display latest messages at the bottom
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[messages.length - 1 - index]; // Reverse the order
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: message["isSentByMe"] ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            if (!message["isSentByMe"]) ...[
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage("assets/images/Ellipse 20.png"),
                              ),
                              SizedBox(width: 8),
                            ],
                            Column(
                              crossAxisAlignment: message["isSentByMe"] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: message["isSentByMe"] ? Color.fromRGBO(243, 255, 244, 1) : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    message["message"],
                                    style: TextStyle(
                                      color: message["isSentByMe"] ? Color.fromRGBO(103, 103, 103, 1) : Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  message["time"],
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_file),
                            hintText: "Write your message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: sendMessage,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF115740),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF115740),
                                    Color.fromARGB(158, 255, 255, 255),
                                  ], begin: Alignment.centerLeft, end: Alignment.topRight),
                                ),
                                child: Image.asset("assets/images/Subtract.png"))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
