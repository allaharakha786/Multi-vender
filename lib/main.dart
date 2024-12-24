import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/view/screens/chat/chat_conversation.dart';
import 'package:multi_vender/view/screens/chat/chat_inbox.dart';
import 'package:multi_vender/view/screens/notification/notification_screen.dart';
import 'package:multi_vender/view/screens/notification/notification_screen2.dart';
import 'package:multi_vender/view/screens/splash/splash_screen.dart';

import 'view/screens/authentication/forgot_password_screen.dart';
import 'view/screens/authentication/signIn/sign_in_screen.dart';
import 'view/screens/authentication/signIn/successfully_login.dart';
import 'view/screens/authentication/signIn/welcomeback_signin.dart';
import 'view/screens/authentication/signup_screen.dart';
import 'view/screens/authentication/signIn/veri_code_screen.dart';
import 'view/screens/proof_identity_document/proof_identity_screen.dart';
import 'view/screens/proof_identity_document/register_successfull.dart';
import 'view/screens/proof_identity_document/upload_document_screen.dart';
import 'view/screens/splash/role_screen.dart';
import 'view/widgets/upload_document_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(mediaQuerySize.width, mediaQuerySize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child:
          GetMaterialApp(debugShowCheckedModeBanner: false, home: ChatScreen()),
    );
  }
}
