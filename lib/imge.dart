// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dotted_decoration/dotted_decoration.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_appnexts/Widgets/textfield.dart';

// class Imge extends StatefulWidget {
//   const Imge({super.key});

//   @override
//   State<Imge> createState() => _ImgeState();
// }

// class _ImgeState extends State<Imge> {
//   TextEditingController resturantnamecontroller = TextEditingController();
//   TextEditingController descriptioncontroller = TextEditingController();
//   TextEditingController openingcontroller = TextEditingController();
//   TextEditingController closingcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Upload',
//           style: TextStyle(
//             color: Color(0xFF181C2E),
//             fontSize: 20,
//             fontWeight: .w400,
//           ),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 height: 258,
//                 width: 342,
//                 decoration: DottedDecoration(shape: Shape.box),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20.0),
//                       child: Container(
//                         width: 58,
//                         height: 46,
//                         child: Image.asset(
//                           'assats/image/Upload icon (1).png',
//                           fit: BoxFit.cover,
//                         ),
//                         // child: Icon(
//                         //   Icons.cloud_download_outlined,
//                         //   color: Color(0xFFEB4646),
//                         // ),
//                       ),
//                     ),
//                     Row(
//                       crossAxisAlignment: .center,
//                       mainAxisAlignment: .center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 30.0),
//                           child: Container(
//                             child: Text(
//                               'Drag & drop files or ',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: .w700,
//                                 color: Color(0xFF333333),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 30.0),
//                           child: Container(
//                             child: Text(
//                               'Drag & drop files or ',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 decorationColor: Color(0xFFEB4646),
//                                 fontSize: 16,
//                                 fontWeight: .w700,
//                                 color: Color(0xFFEB4646),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: Container(
//                         child: Text(
//                           'Supported formates: JPEG, PNG, GIF, ',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: .w400,
//                             color: Color(0xFF676767),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Text(
//                         'MP4, PDF, PSD, AI, Word, PPT ',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: .w400,
//                           color: Color(0xFF676767),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: Opacity(
//                 opacity: 0.5,
//                 child: SizedBox(
//                   height: 45,
//                   width: 240,
//                   child: ElevatedButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Color(0xFFEB4646),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusGeometry.circular(10),
//                         side: BorderSide(color: Color(0xFFEB4646)),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'Upload Files',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: .w700,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             uploadtextfield(
//               text: 'Resturant Name',
//               controller: resturantnamecontroller,
//             ),
//             uploadtextfield(
//               text: 'Description',
//               controller: descriptioncontroller,
//             ),
//             uploadtextfield(
//               text: 'Opening Time',
//               controller: openingcontroller,
//             ),
//             uploadtextfield(
//               text: 'Closing Time',
//               controller: closingcontroller,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseFirestore.instance.collection('resturant').add({
//                   'name': resturantnamecontroller.text,
//                   'description': descriptioncontroller.text,
//                   'opening': openingcontroller.text,
//                   'closing': closingcontroller.text,
//                 });
//               },
//               child: Text('upload'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/Widgets/textfield.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Imge extends StatefulWidget {
  const Imge({super.key});

  @override
  State<Imge> createState() => _ImgeState();
}

class _ImgeState extends State<Imge> {



  
  TextEditingController resturantnamecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController openingcontroller = TextEditingController();
  TextEditingController closingcontroller = TextEditingController();

  RxString imagePath = ''.obs;

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery, // Change to camera if needed
    );
    if (image != null) {
      imagePath.value = image.path;
    }
  }

  Future uploadData() async {
    if (imagePath.value == '') {
      Get.snackbar('Error', 'Please select an image first');
      return;
    }

    await FirebaseFirestore.instance
        .collection('add_restaurant')
        .add({
          'name': resturantnamecontroller.text,
          'description': descriptioncontroller.text,
          'opening': openingcontroller.text,
          'closing': closingcontroller.text,
          'image_path': imagePath.value, // save local path for now
        })
        .then((value) {
          Get.snackbar('Success', 'Restaurant added successfully');
          // Clear after upload
          resturantnamecontroller.clear();
          descriptioncontroller.clear();
          openingcontroller.clear();
          closingcontroller.clear();
          imagePath.value = '';
        })
        .catchError((error) {
          Get.snackbar('Error', 'Failed to add restaurant: $error');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload',
          style: TextStyle(
            color: Color(0xFF181C2E),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Obx(
                () => GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    height: 258,
                    width: 342,
                    decoration: DottedDecoration(shape: Shape.box),
                    child: imagePath.value == ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assats/image/Upload icon (1).png',
                                width: 58,
                                height: 46,
                              ),
                              SizedBox(height: 10),
                              Text('Click to upload image'),
                              Text(
                                'Supported formats: JPEG, PNG, GIF, MP4, PDF',
                              ),
                            ],
                          )
                        : Image.file(File(imagePath.value), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            uploadtextfield(
              text: 'Resturant Name',
              controller: resturantnamecontroller,
            ),
            uploadtextfield(
              text: 'Description',
              controller: descriptioncontroller,
            ),
            uploadtextfield(
              text: 'Opening Time',
              controller: openingcontroller,
            ),
            uploadtextfield(text: 'Closing', controller: closingcontroller),
            SizedBox(height: 20),
            SizedBox(
              height: 45,
              width: 240,
              child: ElevatedButton(
                onPressed: uploadData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEB4646),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Pick Image & Upload',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
