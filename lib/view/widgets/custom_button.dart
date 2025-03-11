import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../controllers/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  Color color;
  TextStyle textStyle;
  Function()? onTap;
  final double? width;
  final bool isEnabled;
  bool isLoading;
  double? height;

  CustomButton({super.key, this.height, this.isLoading = false, required this.name, this.color = AppColors.buttonColor, this.textStyle = const TextStyle(color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'medium'), this.onTap, this.width, this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      width: width ?? mediaQuerySize.width,
      height: height ?? mediaQuerySize.height * 0.06,
      decoration: BoxDecoration(border: Border.all(color: AppColors.buttonColor), color: color, borderRadius: BorderRadius.circular(10)),
      child: isLoading
          ? Padding(
              padding: const EdgeInsets.all(7),
              child: SpinKitThreeInOut(
                color: AppColors.whiteColor,
                size: 35,
              ),
            )
          : TextButton(
              onPressed: onTap,
              child: Text(
                textAlign: TextAlign.center,
                name,
                style: textStyle,
              )),
    );
  }
}
