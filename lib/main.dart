import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/getxControllers/auth_controller.dart';
import 'package:multi_vender/controllers/utils/my_shared_preference.dart';
import 'package:multi_vender/view/screens/apply_for_job.dart';
import 'package:multi_vender/view/screens/authentication/verification_code_screen.dart';
import 'package:multi_vender/view/screens/biding_screen.dart';
import 'package:multi_vender/view/screens/bottom_navigation_bar.dart';
import 'package:multi_vender/view/screens/job_details.dart';
import 'package:multi_vender/view/screens/proof_identity_document/preview_screen.dart';
import 'package:multi_vender/view/screens/proof_identity_document/proof_identity_screen.dart';
import 'package:multi_vender/view/screens/proof_identity_document/upload_document_screen.dart';
import 'package:multi_vender/view/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(mediaQuerySize.width, mediaQuerySize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(debugShowCheckedModeBanner: false, home: BottomNavigationBarScreen()),
    );
  }
}
