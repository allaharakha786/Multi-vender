import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/view/screens/splash/splash_screen.dart';

import 'view/screens/authentication/signup_screen.dart';
import 'view/screens/splash/role_screen.dart';

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
      designSize:Size(mediaQuerySize.width,mediaQuerySize.height),
    minTextAdapt: true,
    splitScreenMode: true,
      child: GetMaterialApp(
      debugShowCheckedModeBanner: false,      
      
        home:  SignupScreen()
      ),
    );
  }
}