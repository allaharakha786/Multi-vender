import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class JobNameWidget extends StatelessWidget {
  const JobNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Card(
                                          elevation: 0,
                                           child: Container(
                                                                    height: mediaQuerySize.height*0.3.h,
                                                                   width: mediaQuerySize.width*0.9.w,
                                                                   decoration: BoxDecoration(
                                                                    
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        
                                                                        blurRadius: 2,
                                                                        spreadRadius: 0,
                                                                        color: Colors.grey
                                                                        
                                                                      )
                                                                    ]
                                                                   ),
                                                                   child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                     children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text('Job Name',style: TextStyle(color: Color(0xff4D4D4D),fontSize: 16,fontWeight: FontWeight.w500),),
                                                                            Text('Total')
                                                                        
                                                                          ],

                                                                        ),
                                                                      ),
                                                                     Padding(
                                                                       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                                       child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                               Text('Time:8:00 AM'),
                                                                        Text('Date::22 Mar 2021, Sunday'),
                                                                            ],
                                                                          ),
                                                                                                                                          Text('\$95.00',style: TextStyle(color: Color(0xff115740),fontSize: 18,fontWeight: FontWeight.bold),),
                                                                       
                                                                          
                                                                        ],
                                                                       ),
                                                                     ),
                                                                     Padding(
                                                                       padding: const EdgeInsets.symmetric(horizontal: 8),
                                                                       child: Text('Location:1012 Ocean avanue, New york, USA'),
                                                                     ),
                                                                     Padding(
                                                                       padding: const  EdgeInsets.symmetric(horizontal: 8),
                                                                       child: Text('Service Cost:\$100.00'),
                                                                     ),
                                                                     Padding(
                                                                       padding: const  EdgeInsets.symmetric(horizontal: 8),
                                                                       child: Text('Tax/Fees:\$10.00'),
                                                                     ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                                                        child: Text('Amount Paid:\$95.00'),
                                                                      ),
                                                                      Padding(
                                                                        padding: const  EdgeInsets.symmetric(horizontal: 8),
                                                                        child: Text('Payment Method:Paid via Visa'),
                                                                      ),
                                                                       Padding(
                                                                         padding: const  EdgeInsets.symmetric(horizontal: 8),
                                                                         child: Text('Transaction ID:1234567890'),
                                                                       ),
                                                                       
                                                                    
                                                                      
                                                                     ],
                                                                   ),
                                           ),
                                         );
  }
}