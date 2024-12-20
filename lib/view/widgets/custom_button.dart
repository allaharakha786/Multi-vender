import 'package:flutter/material.dart';

import '../../controllers/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
   CustomButton({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize =MediaQuery.of(context).size;
    return Container(  
                         height: mediaQuerySize.height*0.07,
                                   width: mediaQuerySize.width*0.9,
                                   decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                   borderRadius: BorderRadius.circular(10)
                                  ),
                               child: TextButton(onPressed: (){},
                            child: Text(name,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)),                                             );
  }
}