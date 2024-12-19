import 'package:flutter/material.dart';

class CustomUserWidget extends StatelessWidget {
  final String text;
    final String img;
    final String secText;
   CustomUserWidget({super.key,required this.text,required this.img,required this.secText});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return  Container(
                    height: mediaQuerySize.height*0.125,
                    width: mediaQuerySize.width*0.8,
                    decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0, 2)
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover)
                            ),
                           
                           
                          ),
                        ),
                        SizedBox(width: 5,),
                               Padding(
                                 padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 5
                                 ),
                                 child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                         Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                         Text(secText,style: TextStyle(fontSize: 12,),)
                                  ],
                                 
                                 ),
                               )                 
   
                        
                      ],
                    )
                   ) ;
  }
}