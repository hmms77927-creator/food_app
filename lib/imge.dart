// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class Imge extends StatefulWidget {
//   const Imge({super.key});
//
//   @override
//   State<Imge> createState() => _ImgeState();
// }
//
// class _ImgeState extends State<Imge> {
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController openController = TextEditingController();
//   TextEditingController closeController = TextEditingController();
//
//   RxString imagePath = ''.obs;
//
//   final docRef = FirebaseFirestore.instance
//       .collection('add_restaurant')
//       .doc('userRestaurant');
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//
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
//       imagePath.value = data['image_path'] ?? '';
//     }
//   }
//
//   Future pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       imagePath.value = image.path;
//     }
//   }
//
//   Future saveData() async {
//     await docRef.set({
//       'name': nameController.text,
//       'description': descController.text,
//       'opening': openController.text,
//       'closing': closeController.text,
//       'image_path': imagePath.value,
//     });
//
//     Get.snackbar("Success", "Data Saved Successfully");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Restaurant Edit"),
//         centerTitle: true,
//       ),
//
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//
//             // IMAGE
//             Obx(() {
//               return GestureDetector(
//                 onTap: pickImage,
//                 child: Container(
//                   height: 180,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: imagePath.value == ''
//                       ? const Center(child: Text("Tap to select image"))
//                       : Image.file(File(imagePath.value), fit: BoxFit.cover),
//                 ),
//               );
//             }),
//
//             const SizedBox(height: 20),
//
//             // NAME
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Color(0xFFBEC5D1)),
//                 ),                labelText: "Restaurant Name",
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             // DESCRIPTION
//             TextField(
//               controller: descController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Color(0xFFBEC5D1)),
//                 ),                labelText: "Description",
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             // OPEN
//             TextField(
//               controller: openController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Color(0xFFBEC5D1)),
//                 ),                labelText: "Opening Time",
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             // CLOSE
//             TextField(
//               controller: closeController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Color(0xFFBEC5D1)),
//                 ),
//                 labelText: "Closing Time",
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             // SAVE BUTTON
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: saveData,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFFEB4646),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

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

  RxString imagePath = ''.obs;

  GoogleMapController? mapController;

  // ⭐ DEFAULT LOCATION (NEVER NULL)
  LatLng selectedLocation = const LatLng(31.5204, 74.3587);

  final docRef = FirebaseFirestore.instance
      .collection('add_restaurant')
      .doc('userRestaurant');

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // ================= LOAD DATA =================
  Future<void> loadData() async {
    final doc = await docRef.get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;

      nameController.text = data['name'] ?? '';
      descController.text = data['description'] ?? '';
      openController.text = data['opening'] ?? '';
      closeController.text = data['closing'] ?? '';
      locationController.text = data['location'] ?? '';
      imagePath.value = data['image_path'] ?? '';

      double lat = data['lat'] ?? 31.5204;
      double lng = data['lng'] ?? 74.3587;

      selectedLocation = LatLng(lat, lng);
    }
  }

  // ================= IMAGE =================
  Future pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path;
    }
  }

  // ================= SEARCH LOCATION =================
  Future<void> searchLocation(String place) async {
    try {
      List<Location> locations = await locationFromAddress(place);
      Location loc = locations.first;

      setState(() {
        selectedLocation = LatLng(loc.latitude, loc.longitude);
      });

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(selectedLocation, 15),
      );
    } catch (e) {
      Get.snackbar("Error", "Location not found");
    }
  }

  // ================= SAVE =================
  Future saveData() async {
    await docRef.set({
      'name': nameController.text,
      'description': descController.text,
      'opening': openController.text,
      'closing': closeController.text,
      'image_path': imagePath.value,
      'location': locationController.text,

      // ⭐ NEVER NULL NOW
      'lat': selectedLocation.latitude,
      'lng': selectedLocation.longitude,
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

            // ================= IMAGE =================
            Obx(() {
              return GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border.all()),
                  child: imagePath.value.isEmpty
                      ? const Center(child: Text("Pick Image"))
                      : Image.file(File(imagePath.value), fit: BoxFit.cover),
                ),
              );
            }),

            const SizedBox(height: 10),

            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: descController, decoration: const InputDecoration(labelText: "Description")),
            TextField(controller: openController, decoration: const InputDecoration(labelText: "Opening")),
            TextField(controller: closeController, decoration: const InputDecoration(labelText: "Closing")),

            // ================= SEARCH =================
            TextField(
              controller: locationController,
              onSubmitted: searchLocation,
              decoration: const InputDecoration(
                labelText: "Search Location",
                suffixIcon: Icon(Icons.search),
              ),
            ),

            const SizedBox(height: 10),

            // ================= MAP =================
            SizedBox(
              height: 250,
              child: GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                },

                // ⭐ TAP TO CHANGE LOCATION
                onTap: (pos) {
                  setState(() {
                    selectedLocation = pos;
                  });
                },

                initialCameraPosition: CameraPosition(
                  target: selectedLocation,
                  zoom: 12,
                ),

                markers: {
                  Marker(
                    markerId: const MarkerId("restaurant"),
                    position: selectedLocation,
                  ),
                },
              ),
            ),

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