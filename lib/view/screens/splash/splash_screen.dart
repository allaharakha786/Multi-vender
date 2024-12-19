import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_vender/controllers/utils/app_colors.dart';
import 'package:multi_vender/view/widgets/custom_button.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
            Column(
              children:[ Container(
                width: mediaQuerySize.width.w,
                height: mediaQuerySize.height*0.7.h,
                decoration: BoxDecoration(
                
                  //image: DecorationImage(image: AssetImage(''))
                ),
                child: SvgPicture.asset('assets/svg/splash_bg.svg'),
              ),
            //   Container(
            //   width: mediaQuerySize.width.w,
            //   height: mediaQuerySize.height*0.5,
            //   decoration: BoxDecoration(
            //     color: Colors.amber,
                
            //   ),
            // )
              ]
            ),
             Positioned(bottom: 0,
               child: Column(
                 children: [
                  
                  // Container(
                  //   height: mediaQuerySize.height*0.6.h,
                  //   width: mediaQuerySize.width.w,
                  //   child: SvgPicture.asset('assets/images/svg/splash_img.svg',fit: BoxFit.contain,)),

 Container(height: mediaQuerySize.height*0.6.h ,
  width: mediaQuerySize.width.w,
 child:Image.asset('assets/images/splash_image.png',fit: BoxFit.cover,),
),
                

                   Container(
                           width: mediaQuerySize.width.w,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                             boxShadow: [
                               BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(0, 3)
                               ),
                             ]
                           ),
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                             child: Column(
                                           children: [
                                            SizedBox(height: mediaQuerySize.height*0.025.h,),
                                             Text('Welcome to Suneeb',style: TextStyle(color: Color(0xff4D4D4D),fontSize: 22,fontWeight: FontWeight.bold),),
                                            SizedBox(height: mediaQuerySize.height*0.01.h,),
                                             Padding(
                                               padding: const EdgeInsets.symmetric(horizontal:28),
                                               child: Text('From home repairs to creative projects, get it done with ease. On-demand skilled handymen and women at your fingertips. We call them Doers.', textAlign:TextAlign.center ,style: TextStyle(color: Colors.black.withOpacity(0.5),fontWeight: FontWeight.w400,fontSize: 16),),
                                             ),
                                                                                        SizedBox(height: mediaQuerySize.height*0.023.h,),
                             
                                            CustomButton(name: 'Get Started'),
                                                                                         SizedBox(height: mediaQuerySize.height*0.02.h,),
                             
                                           ],
                             ),
                           ),
                         ),
                 ],
               ),
             ),
            

          ],
          
        ),
        
      ),
      
      // bottomSheet: Container(
      //   //height: mediaQuerySize.height*0.3.h,
      //   width: mediaQuerySize.width.w,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 4,
      //         spreadRadius: 1,
      //         offset: Offset(0, 3)
      //       ),
      //     ]
      //   ),
      //   child: SizedBox(

      //     height: mediaQuerySize.height*0.5.h,
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //       child: Column(
      //         children: [
      //           Text('Welcome to Suneeb',style: TextStyle(color: Color(0xff4D4D4D),fontSize: 16,fontWeight: FontWeight.bold),),
      //           SizedBox(height: 10,),
      //           Text('From home repairs to creative projects, get it done with ease. On-demand skilled handymen and women at your fingertips. We call them Doers.', textAlign:TextAlign.center ,style: TextStyle(color: Colors.black.withOpacity(0.5),fontWeight: FontWeight.w400,fontSize: 13),),
               
      //           Container(
      //             height: mediaQuerySize.height*0.07,
      //             width: mediaQuerySize.width*0.8,
      //             decoration: BoxDecoration(
      //               color: AppColors.buttonColor,
      //               borderRadius: BorderRadius.circular(10)
      //             ),
      //             child: TextButton(onPressed: (){},
      //              child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}


