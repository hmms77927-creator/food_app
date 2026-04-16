// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
//
// class Imge extends StatefulWidget {
//   const Imge({super.key});
//
//   @override
//   State<Imge> createState() => _ImgeState();
// }
//
// class _ImgeState extends State<Imge> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController openController = TextEditingController();
//   TextEditingController closeController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//
//   RxString imagePath = ''.obs;
//
//   GoogleMapController? mapController;
//   LatLng selectedLocation = const LatLng(31.5204, 74.3587);
//
//   late final docRef = FirebaseFirestore.instance
//       .collection('add_restaurant')
//       // .doc('userRestaurant');
//   .add({
//     'name':nameController.text,
//     'desc':descController.text,
//     'close':closeController.text,
//     'location':locationController.text,
//   });
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//   Future<void> loadData() async {
//     final doc = await docRef.get();
//
//     if (doc.exists) {
//       final data = doc.data() as Map<String, dynamic>;
//
//       nameController.text = data['name'] ?? '';
//       descController.text = data['description'] ?? '';
//       openController.text = data['opening'] ?? '';
//       closeController.text = data['closing'] ?? '';
//       locationController.text = data['location'] ?? '';
//       imagePath.value = data['image_path'] ?? '';
//
//       double lat = data['lat'] ?? 31.5204;
//       double lng = data['lng'] ?? 74.3587;
//
//       selectedLocation = LatLng(lat, lng);
//     }
//   }
//   Future pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       imagePath.value = image.path;
//     }
//   }
//   Future<void> searchLocation(String place) async {
//     try {
//       List<Location> locations = await locationFromAddress(place);
//       Location loc = locations.first;
//
//       setState(() {
//         selectedLocation = LatLng(loc.latitude, loc.longitude);
//       });
//
//       mapController?.animateCamera(
//         CameraUpdate.newLatLngZoom(selectedLocation, 15),
//       );
//     } catch (e) {
//       Get.snackbar("Error", "Location not found");
//     }
//   }
//   Future saveData() async {
//     await docRef.set({
//       'name': nameController.text,
//       'description': descController.text,
//       'opening': openController.text,
//       'closing': closeController.text,
//       'image_path': imagePath.value,
//       'location': locationController.text,
//       'lat': selectedLocation.latitude,
//       'lng': selectedLocation.longitude,
//     });
//     Get.snackbar("Success", "Saved Successfully");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Restaurant Map"),
//         backgroundColor: const Color(0xFFEB4646),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Obx(() {
//               return GestureDetector(
//                 onTap: pickImage,
//                 child: Container(
//                   height: 180,
//                   width: double.infinity,
//                   decoration: BoxDecoration(border: Border.all()),
//                   child: imagePath.value.isEmpty
//                       ? const Center(child: Text("Pick Image"))
//                       : Image.file(File(imagePath.value), fit: BoxFit.cover),
//                 ),
//               );
//             }),
//             const SizedBox(height: 10),
//             TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
//             TextField(controller: descController, decoration: const InputDecoration(labelText: "Description")),
//             TextField(controller: openController, decoration: const InputDecoration(labelText: "Opening")),
//             TextField(controller: closeController, decoration: const InputDecoration(labelText: "Closing")),
//             TextField(
//               controller: locationController,
//               onSubmitted: searchLocation,
//               decoration: const InputDecoration(
//                 labelText: "Search Location",
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 250,
//               child: GoogleMap(
//                 onMapCreated: (controller) {
//                   mapController = controller;
//                 },
//                 onTap: (pos) {
//                   setState(() {
//                     selectedLocation = pos;
//                   });
//                 },
//                 initialCameraPosition: CameraPosition(
//                   target: selectedLocation,
//                   zoom: 12,
//                 ),
//                 markers: {
//                   Marker(
//                     markerId: const MarkerId("restaurant"),
//                     position: selectedLocation,
//                   ),
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFEB4646),
//               ),
//               onPressed: saveData,
//               child: const Text("Save"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'map_1.dart';

class Imge extends StatefulWidget {
  const Imge({super.key});

  @override
  State<Imge> createState() => _ImgeState();
}

class _ImgeState extends State<Imge> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController openController = TextEditingController();
  TextEditingController closeController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  GoogleMapController? mapController;

  String imagePath = '';
  LatLng selectedLocation = const LatLng(31.5204, 74.3587);

  /// ✅ ONE USER = ONE DOC
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  late final DocumentReference docRef = FirebaseFirestore.instance
      .collection('add_restaurant')
      .doc(uid);

  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<void> loadData() async {
    final doc = await docRef.get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;

      nameController.text = data['name'] ?? '';
      descController.text = data['description'] ?? '';
      openController.text = data['opening'] ?? '';
      closeController.text = data['closing'] ?? '';
      // locationController.text = data['location'] ?? '';
      imagePath = data['image_path'] ?? '';

      // double lat = (data['lat'] ?? 31.5204).toDouble();
      // double lng = (data['lng'] ?? 74.3587).toDouble();

      // selectedLocation = LatLng(lat, lng);

      setState(() {});
    }
  }
  Future pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }
  // Future<void> searchLocation(String place) async {
  //   try {
  //     List<Location> locations = await locationFromAddress(place);
  //
  //     if (locations.isEmpty) return;
  //
  //     final loc = locations.first;
  //
  //     setState(() {
  //       selectedLocation = LatLng(loc.latitude, loc.longitude);
  //     });
  //
  //     mapController?.animateCamera(
  //       CameraUpdate.newLatLngZoom(selectedLocation, 15),
  //     );
  //   } catch (e) {
  //     Get.snackbar("Error", "Location not found");
  //   }
  // }
  Future saveData() async {
    await docRef.set({
      'name': nameController.text,
      'description': descController.text,
      'opening': openController.text,
      'closing': closeController.text,
      'location': locationController.text,
      'image_path': imagePath,
      // 'lat': selectedLocation.latitude,
      // 'lng': selectedLocation.longitude,
      'uid': uid,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    Get.snackbar("Success", "Saved Successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Map"),
        backgroundColor: const Color(0xFFEB4646),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
                child: imagePath.isEmpty
                    ? const Center(child: Text("Pick Image"))
                    : Image.file(File(imagePath), fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: openController,
              decoration: const InputDecoration(labelText: "Opening"),
            ),
            TextField(
              controller: closeController,
              decoration: const InputDecoration(labelText: "Closing"),
            ),

            // GestureDetector(
            //   onTap: (){
            //     Get.to( Map1());
            //   },
            //   child: TextField(
            //     controller: locationController,
            //     // onSubmitted: searchLocation,
            //     decoration: const InputDecoration(
            //       labelText: "Search Location",
            //       suffixIcon: Icon(Icons.search),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Get.to(() => const Map1());
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: "Search Location",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            // SizedBox(
            //   height: 250,
            //   child: GoogleMap(
            //     onMapCreated: (controller) {
            //       mapController = controller;
            //     },
            //     onTap: (pos) {
            //       setState(() {
            //         selectedLocation = pos;
            //       });
            //     },
            //     initialCameraPosition: CameraPosition(
            //       target: selectedLocation,
            //       zoom: 12,
            //     ),
            //     markers: {
            //       Marker(
            //         markerId: const MarkerId("restaurant"),
            //         position: selectedLocation,
            //       ),
            //     },
            //   ),
            // ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEB4646),
              ),
              onPressed: saveData,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}