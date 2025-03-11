import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/controllers/utils/app_textstyles.dart';

class CircleCheckBox extends StatelessWidget {
  final String text;
  final RxBool isChecked;
  final ValueChanged<bool>? onChanged;

  CircleCheckBox({
    Key? key,
    required this.text,
    required this.isChecked,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaquerySize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            isChecked.value = !isChecked.value;
            if (onChanged != null) {
              onChanged!(isChecked.value);
            }
          },
          child: Obx(
            () => Container(
              height: mediaquerySize.height * 0.027.h,
              width: mediaquerySize.width * 0.05.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked.value ? AppColors.buttonColor : Colors.transparent,
                border: Border.all(color: Colors.black.withOpacity(0.07), width: 2),
              ),
              child: isChecked.value
                  ? Center(
                      child: Icon(
                        Icons.check,
                        color: AppColors.whiteColor,
                        size: 12,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(width: mediaquerySize.width * 0.03),
        Text(text, style: AppTextstyles.simpleText().copyWith(color: AppColors.blackColor, fontSize: 13)),
      ],
    );
  }
}
