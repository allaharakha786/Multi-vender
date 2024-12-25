import 'package:flutter/material.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';

class AppTextstyles {
  static TextStyle simpleTextBold() {
    return TextStyle(color: AppColors.whiteColor, fontSize: 18, fontFamily: 'bold');
  }

  static TextStyle simpleText() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontFamily: 'regular',
      fontSize: 16,
    );
  }

  static TextStyle simpleTextMedium() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontFamily: 'medium',
      fontSize: 16,
    );
  }
}
