import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vender/view/screens/choose_account.dart';
import 'package:multi_vender/view/screens/choose_payment_method.dart';
import 'package:multi_vender/view/screens/dashboard.dart';
import 'package:multi_vender/view/screens/doers_home_screen.dart';
import 'package:multi_vender/view/screens/job_information.dart';
import 'package:multi_vender/view/screens/poster_home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

RxInt selectedIndex = 0.obs;
List<Widget> screens = [PosterHomeScreen(), ChoosePaymentMethod()];

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return screens[selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            onTap: (value) {
              selectedIndex.value = value;
            },
            currentIndex: selectedIndex.value,
            items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(label: 'Jobss', icon: Icon(Icons.access_time))]);
      }),
    );
  }
}
