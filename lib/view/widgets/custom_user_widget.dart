import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserWidget extends StatelessWidget {
  final String text;
  final String img;
  final String secText;
  Function()? onTap;
  CustomUserWidget({super.key, required this.text, required this.img, required this.secText, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: mediaQuerySize.height * 0.125.h,
          width: mediaQuerySize.width * 0.8.w,
          decoration: BoxDecoration(
              color: Colors.white,
              // color: Colors.grey.withOpacity(0.09),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 0, offset: Offset(0, 3))]),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black.withOpacity(0.07), image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    secText,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
