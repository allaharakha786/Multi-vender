
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/camer_controller.dart';

class CameraCaptureWidget extends StatelessWidget {
  final CameraController _cameraController = Get.put(CameraController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min, // Ensure it doesn't take infinite height
      children: [
        // Display the captured image
        Obx(() {
          return _cameraController.capturedImage.value != null
              ? Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: mediaQuerySize.height * 0.2.h,
                  width: mediaQuerySize.width * 0.7.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(_cameraController.capturedImage.value!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: _cameraController.captureImage,
                  child: Container(
                    height: mediaQuerySize.height * 0.11.h,
                    width: mediaQuerySize.width * 0.9.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          "Take a Photo",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ],
    );
  }
}


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../controllers/camer_controller.dart';


// class CameraCaptureWidget extends StatelessWidget {
//   final CameraController _cameraController = Get.put(CameraController());

//   @override
//   Widget build(BuildContext context) {
//     Size mediaQuerySize = MediaQuery.of(context).size;
//     return Scaffold(
    
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the captured image
//             Obx(() {
//               return _cameraController.capturedImage.value != null
//                   ? Container(
//                        margin: EdgeInsets.all(10),
//                     padding: EdgeInsets.all(10),
//                     height: mediaQuerySize.height * 0.2.h,
//                     width: mediaQuerySize.width * 0.7.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           image: FileImage(_cameraController.capturedImage.value!),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     )
//                   : GestureDetector(
//               onTap: _cameraController.captureImage,
//               child: Container(
//                   height: mediaQuerySize.height*0.11.h,
//             width: mediaQuerySize.width*0.9.w,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.07),
//               borderRadius: BorderRadius.circular(10),
//             ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.camera_alt, color: Colors.grey),
//                     SizedBox(width: 8),
//                     Text(
//                       "Open Camera",
//                       style: TextStyle(color: Colors.grey, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//             }),
//             // SizedBox(height: 20),
            
//           ],
//         ),
//       ),
//     );
//   }
// }

