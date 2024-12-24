import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vender/view/widgets/custom_user_widget.dart';
class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Container(
          decoration: BoxDecoration(
           gradient: LinearGradient(
      colors: [
Color(0xff115740),        Colors.white,
      ],
      stops: [
        0.3, // 30% of the gradient's length will be green
        1.0, // Remaining 70% will transition to white
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
          ),
          child: Column(
            children: [
              SizedBox(height: mediaQuerySize.height*0.05.h,),
              Row(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 40,
                      width: 40,
                      // height: mediaQuerySize.height*0.1.h,
                      // width: mediaQuerySize.width*0.06.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child:IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text('Select Your Role',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                  )
        
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: mediaQuerySize.height.h,
                width: mediaQuerySize.width.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Column(
                  children: [
                   SizedBox(height: 60,),

                    CustomUserWidget(
                    secText: 'You can post a job',
                    text: 'Poster', img: 'assets/images/postr_image.png'),
                   SizedBox(height: 20,),
                    CustomUserWidget(
                    secText: 'You can apply on to the job',
                    text: 'Doer', img: 'assets/images/doerr_image.png'),
                  
                  
                    
                  ],
                ),
              ),
            ],
          ),
        )
            
        ),
        )
        );
      
    
  }
}