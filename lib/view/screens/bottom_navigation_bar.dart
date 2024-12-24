import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/view/screens/chat/chat_inbox.dart';

import 'package:multi_vender/view/screens/jobs_screen.dart';
import 'package:multi_vender/view/screens/notification/notification_screen.dart';
import 'package:multi_vender/view/screens/poster_home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

RxInt selectedIndex = 0.obs;
List<Widget> screens = [PosterHomeScreen(), JobScreen(), ChatInbox(), NotificationScreen()];

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return screens[selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            selectedItemColor: AppColors.buttonColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              selectedIndex.value = value;
            },
            currentIndex: selectedIndex.value,
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(color: selectedIndex.value == 0 ? AppColors.buttonColor : Colors.grey, 'assets/svg/home_icon.svg'), label: 'Home'),
              BottomNavigationBarItem(label: 'Jobs', icon: SvgPicture.asset(color: selectedIndex.value == 1 ? AppColors.buttonColor : Colors.grey, 'assets/svg/jobs_icon.svg')),
              BottomNavigationBarItem(
                  label: 'Message',
                  icon: SvgPicture.asset(
                    'assets/svg/messages_icon.svg',
                    color: selectedIndex.value == 2 ? AppColors.buttonColor : Colors.grey,
                  )),
              BottomNavigationBarItem(label: 'settings', icon: Icon(Icons.settings))
            ]);
      }),
    );
  }
}
