// // import 'dart:io';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:dotted_decoration/dotted_decoration.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'Widget/textfield.dart';
// //
// // class Imge extends StatefulWidget {
// //   const Imge({super.key});
// //
// //   @override
// //   State<Imge> createState() => _ImgeState();
// // }
// //
// // class _ImgeState extends State<Imge> {
// //   TextEditingController resturantnamecontroller = TextEditingController();
// //   TextEditingController descriptioncontroller = TextEditingController();
// //   TextEditingController openingcontroller = TextEditingController();
// //   TextEditingController closingcontroller = TextEditingController();
// //
// //   RxString imagePath = ''.obs;
// //
// //   Future pickImage() async {
// //     final ImagePicker picker = ImagePicker();
// //     final XFile? image = await picker.pickImage(
// //       source: ImageSource.gallery, // Change to camera if needed
// //     );
// //     if (image != null) {
// //       imagePath.value = image.path;
// //     }
// //   }
// //
// //   Future uploadData() async {
// //     if (imagePath.value == '') {
// //       Get.snackbar('Error', 'Please select an image first');
// //       return;
// //     }
// //
// //     await FirebaseFirestore.instance.collection('add_restaurant').add({
// //       'name': resturantnamecontroller.text,
// //       'description': descriptioncontroller.text,
// //       'opening': openingcontroller.text,
// //       'closing': closingcontroller.text,
// //       'image_path': imagePath.value, // save local path for now
// //     }).then((value) {
// //       Get.snackbar('Success', 'Restaurant added successfully');
// //       // Clear after upload
// //       resturantnamecontroller.clear();
// //       descriptioncontroller.clear();
// //       openingcontroller.clear();
// //       closingcontroller.clear();
// //       imagePath.value = '';
// //     }).catchError((error) {
// //       Get.snackbar('Error', 'Failed to add restaurant: $error');
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Upload', style: TextStyle(color: Color(0xFF181C2E), fontSize: 20, fontWeight: FontWeight.w400)),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Center(
// //               child: Obx(() => GestureDetector(
// //                 onTap: pickImage,
// //                 child: Container(
// //                   height: 258,
// //                   width: 342,
// //                   decoration: DottedDecoration(shape: Shape.box),
// //                   child: imagePath.value == ''
// //                       ? Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Image.asset('assats/image/Upload icon (1).png', width: 58, height: 46),
// //                       SizedBox(height: 10),
// //                       Text('Click to upload image'),
// //                       Text('Supported formats: JPEG, PNG, GIF, MP4, PDF'),
// //                     ],
// //                   )
// //                       : Image.file(File(imagePath.value), fit: BoxFit.cover),
// //                 ),
// //               )),
// //             ),
// //             SizedBox(height: 20),
// //             CustomTextField(text: 'Resturant Name', controller: resturantnamecontroller),
// //             CustomTextField(text: 'Description', controller: descriptioncontroller),
// //             CustomTextField(text: 'Opening Time', controller: openingcontroller),
// //             CustomTextField(text: 'Closing', controller: closingcontroller),
// //             SizedBox(height: 20),
// //             SizedBox(
// //               height: 45,
// //               width: 240,
// //               child: ElevatedButton(
// //                 onPressed: uploadData,
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Color(0xFFEB4646),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                 ),
// //                 child: Text('Pick Image & Upload', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'Models/model_users.dart';
import 'Widget/textfield.dart';

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

  // Future uploadData() async {
  //   if (imagePath.value == '') {
  //     Get.snackbar('Error', 'Please select an image first');
  //     return;
  //   }
  //   Get.to(ResturantMenu(), arguments: {
  //     'name': name,
  //     'description': description,
  //     'opening': opening,
  //     'closing': closing,
  //     'image': imagePath.value,
  //   });
  //   await FirebaseFirestore.instance.collection('add_restaurant').add({
  //     'name': resturantnamecontroller.text,
  //     'description': descriptioncontroller.text,
  //     'opening': openingcontroller.text,
  //     'closing': closingcontroller.text,
  //     'image_path': imagePath.value, // save local path for now
  //   // }).then((value) {
  //   )};
  //
  //     Get.snackbar('Success', 'Restaurant added successfully');
  //     // Clear after upload
  //     resturantnamecontroller.clear();
  //     descriptioncontroller.clear();
  //     openingcontroller.clear();
  //     closingcontroller.clear();
  //     imagePath.value = '';
  //   }).catchError((error) {
  //     Get.snackbar('Error', 'Failed to add restaurant: $error');
  //   });
  // }
  Future uploadData() async {
    if (imagePath.value == '') {
      Get.snackbar('Error', 'Please select an image first');
      return;
    }

    String name = resturantnamecontroller.text.trim();
    String description = descriptioncontroller.text.trim();
    String opening = openingcontroller.text.trim();
    String closing = closingcontroller.text.trim();

    if (name.isEmpty || description.isEmpty || opening.isEmpty || closing.isEmpty) {
      Get.snackbar('Error', 'All fields required');
      return;
    }

    try {

      await FirebaseFirestore.instance.collection('add_restaurant').add({
        'name': name,
        'description': description,
        'opening': opening,
        'closing': closing,
        'image_path': imagePath.value, // ✅ SAME KEY
      });

      // ✅ NAVIGATION WITH ARGUMENTS
      // Get.to(
      //       () =>  ResturantMenu(),
      //   arguments: {
      //     'name': name,
      //     'description': description,
      //     'opening': opening,
      //     'closing': closing,
      //     'image': imagePath.value,
      //   },
      // );

      Get.snackbar('Success', 'Data Added');

    } catch (e) {
      print(e); // ✅ DEBUG
      Get.snackbar('Error', e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload', style: TextStyle(color: Color(0xFF181C2E), fontSize: 20, fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Obx(() => GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 258,
                  width: 342,
                  decoration: DottedDecoration(shape: Shape.box),
                  child: imagePath.value == ''
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assats/image/Upload icon (1).png', width: 58, height: 46),
                      SizedBox(height: 10),
                      Text('Click to upload image'),
                      Text('Supported formats: JPEG, PNG, GIF, MP4, PDF'),
                    ],
                  )
                      : Image.file(File(imagePath.value), fit: BoxFit.cover),
                ),
              )),
            ),
            SizedBox(height: 20),
            CustomTextField(text: 'Resturant Name', controller: resturantnamecontroller),
            CustomTextField(text: 'Description', controller: descriptioncontroller),
            CustomTextField(text: 'Opening Time', controller: openingcontroller),
            CustomTextField(text: 'Closing', controller: closingcontroller),
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
                child: Text('Pick Image & Upload', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}