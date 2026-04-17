// // import 'package:flutter/material.dart';
// //
// // class Map1 extends StatefulWidget {
// //   const Map1({super.key});
// //
// //   @override
// //   State<Map1> createState() => _Map1State();
// // }
// //
// // class _Map1State extends State<Map1> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SizedBox(
// //         height: 800,
// //         child: Stack(
// //           children: [
// //             Container(
// //               width: double.infinity,
// //               height: double.infinity,
// //               child: Image.asset(
// //                 'assats/image/dd36c1b8bd76638d992ab7e29a0cd2c6606c4115.png',
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             Positioned(
// //               top: 46,
// //               left: 24,
// //               child: SizedBox(
// //                 height: 62,
// //                 width: 327,
// //                 child: TextField(
// //                   decoration: InputDecoration(
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     hint: Text('Enter Your Location'),
// //                     hintStyle: TextStyle(color: Colors.white),
// //                     prefix: IconButton(
// //                       onPressed: () {},
// //                       icon: Icon(Icons.search, color: Colors.black),
// //                     ),
// //                     suffix: Padding(
// //                       padding: const EdgeInsets.only(top: 20.0),
// //                       child: CircleAvatar(
// //                         radius: 20,
// //                         backgroundImage: AssetImage(
// //                           'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
// //                         ),
// //                       ),
// //                     ),
// //                     fillColor: Colors.white,
// //                     filled: true,
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Positioned(
// //               top: 420,
// //               left: 24,
// //               child: SizedBox(
// //                 height: 45,
// //                 width: 240,
// //                 child: ElevatedButton(
// //                   style: TextButton.styleFrom(
// //                     backgroundColor: Color(0xFFEB4646),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadiusGeometry.circular(12),
// //                       side: BorderSide(color: Color(0xFFEB4646)),
// //                     ),
// //                   ),
// //                   onPressed: () {},
// //                   child: Text(
// //                     'Continue',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 16,
// //                       fontWeight: .w700,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_appnexts/imge.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geocoding/geocoding.dart' as geo;
// // import 'package:get/get.dart';
// //
// // class Map1 extends StatefulWidget {
// //   const Map1({super.key});
// //
// //   @override
// //   State<Map1> createState() => _Map1State();
// // }
// //
// // class _Map1State extends State<Map1> {
// //   Completer<GoogleMapController> mapController = Completer();
// //
// //   TextEditingController searchController = TextEditingController();
// //
// //   LatLng initialPosition = const LatLng(31.5204, 74.3587);
// //   LatLng? searchedLocation;
// //
// //   Future<void> searchLocation(String place) async {
// //     try {
// //       List<geo.Location> locations =
// //       await geo.locationFromAddress(place);
// //
// //       if (locations.isEmpty) return;
// //
// //       final loc = locations.first;
// //
// //       final newPosition = LatLng(loc.latitude, loc.longitude);
// //
// //       setState(() {
// //         searchedLocation = newPosition;
// //       });
// //
// //       final controller = await mapController.future;
// //
// //       controller.animateCamera(
// //         CameraUpdate.newLatLngZoom(newPosition, 15),
// //       );
// //     } catch (e) {
// //       Get.snackbar("Error", "Location not found");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           /// ================= GOOGLE MAP (FULL BACKGROUND) =================
// //           GoogleMap(
// //             initialCameraPosition: CameraPosition(
// //               target: initialPosition,
// //               zoom: 14,
// //             ),
// //             onMapCreated: (controller) {
// //               mapController.complete(controller);
// //             },
// //             markers: {
// //               if (searchedLocation != null)
// //                 Marker(
// //                   markerId: const MarkerId("searched"),
// //                   position: searchedLocation!,
// //                 ),
// //             },
// //           ),
// //
// //           /// ================= SEARCH BAR (YOUR UI FIXED) =================
// //           Positioned(
// //             top: 46,
// //             left: 24,
// //             right: 24,
// //             child: SizedBox(
// //               height: 62,
// //               child: TextField(
// //                 controller: searchController,
// //                 onSubmitted: searchLocation,
// //                 decoration: InputDecoration(
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //
// //                   hintText: 'Enter Your Location',
// //                   hintStyle: const TextStyle(color: Colors.grey),
// //
// //                   prefixIcon: IconButton(
// //                     onPressed: () {
// //                       searchLocation(searchController.text);
// //                     },
// //                     icon: const Icon(Icons.search, color: Colors.black),
// //                   ),
// //
// //                   suffixIcon: const CircleAvatar(
// //                     radius: 18,
// //                     backgroundImage: AssetImage(
// //                       'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
// //                     ),
// //                   ),
// //
// //                   fillColor: Colors.white,
// //                   filled: true,
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           /// ================= CONTINUE BUTTON =================
// //           Positioned(
// //             bottom: 40,
// //             left: 24,
// //             child: SizedBox(
// //               height: 45,
// //               width: 240,
// //               child: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color(0xFFEB4646),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                 ),
// //                 onPressed: () {
// //                   Get.to(Imge());
// //                 },
// //                 child: const Text(
// //                   'Continue',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w700,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:get/get.dart';
// //
// // class SearchScreen extends StatefulWidget {
// //   const SearchScreen({super.key});
// //
// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }
// //
// // class _SearchScreenState extends State<SearchScreen> {
// //
// //   TextEditingController controller = TextEditingController();
// //   List predictions = [];
// //
// //   Future<void> getSuggestions(String input) async {
// //     const apiKey = "AIzaSyC2JgccRMqweChAxeShHiLLaFnVLrPBe_I";
// //
// //     final url =
// //         "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:pk";
// //
// //     final response = await http.get(Uri.parse(url));
// //
// //     if (response.statusCode == 200) {
// //       final data = json.decode(response.body);
// //
// //       setState(() {
// //         predictions = data['predictions'];
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //
// //           /// 🔴 SAME SEARCH BAR UI
// //           Positioned(
// //             top: 46,
// //             left: 24,
// //             right: 24,
// //             child: SizedBox(
// //               height: 62,
// //               child: TextField(
// //                 controller: controller,
// //                 autofocus: true,
// //                 onChanged: (value) {
// //                   getSuggestions(value);
// //                 },
// //                 decoration: InputDecoration(
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //
// //                   hintText: 'Enter Your Location',
// //                   hintStyle: const TextStyle(color: Colors.grey),
// //
// //                   prefixIcon: const Icon(Icons.search, color: Colors.black),
// //
// //                   suffixIcon: const CircleAvatar(
// //                     radius: 18,
// //                     backgroundImage: AssetImage(
// //                       'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
// //                     ),
// //                   ),
// //
// //                   fillColor: Colors.white,
// //                   filled: true,
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           /// 🔍 SUGGESTIONS
// //           Positioned(
// //             top: 120,
// //             left: 24,
// //             right: 24,
// //             bottom: 0,
// //             child: Container(
// //               color: Colors.white,
// //               child: ListView.builder(
// //                 itemCount: predictions.length,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     leading: const Icon(Icons.location_on),
// //                     title: Text(predictions[index]['description']),
// //                     onTap: () {
// //                       Get.back(result: predictions[index]['description']);
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart' as geo;
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//
//   Completer<GoogleMapController> mapController = Completer();
//
//   TextEditingController controller = TextEditingController();
//
//   List predictions = [];
//
//   LatLng initialPosition = const LatLng(31.5204, 74.3587);
//   LatLng? selectedLocation;
//
//   double? selectedLat;
//   double? selectedLng;
//
//   /// 🔍 AUTOCOMPLETE
//   Future<void> getSuggestions(String input) async {
//     const apiKey = "AIzaSyC2JgccRMqweChAxeShHiLLaFnVLrPBe_I";
//
//     final url =
//         "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:pk";
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//
//       setState(() {
//         predictions = data['predictions'];
//       });
//     }
//   }
//
//   /// 📍 TEXT → LAT LNG
//   Future<void> moveToLocation(String place) async {
//     try {
//       List<geo.Location> locations =
//       await geo.locationFromAddress(place);
//
//       if (locations.isEmpty) return;
//
//       final loc = locations.first;
//
//       final newPosition = LatLng(loc.latitude, loc.longitude);
//
//       setState(() {
//         selectedLocation = newPosition;
//         selectedLat = loc.latitude;
//         selectedLng = loc.longitude;
//       });
//
//       final map = await mapController.future;
//
//       map.animateCamera(
//         CameraUpdate.newLatLngZoom(newPosition, 15),
//       );
//
//     } catch (e) {
//       Get.snackbar("Error", "Location not found");
//     }
//   }
//
//   /// 💾 SAVE TO FIRESTORE
//   Future<void> saveLocation() async {
//     if (selectedLat == null || selectedLng == null) {
//       Get.snackbar("Error", "Select location first");
//       return;
//     }
//
//     await FirebaseFirestore.instance.collection("locations").add({
//       "name": controller.text,
//       "lat": selectedLat,
//       "lng": selectedLng,
//       "createdAt": DateTime.now(),
//     });
//
//     Get.snackbar("Success", "Location Saved");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           /// 🗺️ GOOGLE MAP
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: initialPosition,
//               zoom: 14,
//             ),
//             onMapCreated: (controller) {
//               mapController.complete(controller);
//             },
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             markers: {
//               if (selectedLocation != null)
//                 Marker(
//                   markerId: const MarkerId("selected"),
//                   position: selectedLocation!,
//                 ),
//             },
//           ),
//
//           /// 🔴 SEARCH BAR
//           Positioned(
//             top: 46,
//             left: 24,
//             right: 24,
//             child: SizedBox(
//               height: 62,
//               child: TextField(
//                 controller: controller,
//                 onChanged: (value) {
//                   getSuggestions(value);
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   hintText: 'Enter Your Location',
//                   prefixIcon: const Icon(Icons.search),
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//             ),
//           ),
//
//           /// 🔍 SUGGESTIONS
//           if (predictions.isNotEmpty)
//             Positioned(
//               top: 120,
//               left: 24,
//               right: 24,
//               child: Container(
//                 color: Colors.white,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: predictions.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(predictions[index]['description']),
//                       onTap: () {
//                         String place =
//                         predictions[index]['description'];
//
//                         controller.text = place;
//                         predictions.clear();
//
//                         moveToLocation(place);
//
//                         setState(() {});
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//           /// 🔴 FIRESTORE DATA LIST
//           Positioned(
//             bottom: 110,
//             left: 24,
//             right: 24,
//             child: Container(
//               height: 150,
//               // color: Colors.white,
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection("locations")
//                     .orderBy("createdAt", descending: true)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//
//                   if (!snapshot.hasData) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//
//                   var docs = snapshot.data!.docs;
//
//                   return ListView.builder(
//                     itemCount: docs.length,
//                     itemBuilder: (context, index) {
//                       var data = docs[index];
//
//                       return ListTile(
//                         title: Text(data["name"]),
//                         onTap: () async {
//
//                           LatLng pos =
//                           LatLng(data["lat"], data["lng"]);
//
//                           final map = await mapController.future;
//
//                           map.animateCamera(
//                             CameraUpdate.newLatLngZoom(pos, 15),
//                           );
//
//                           setState(() {
//                             selectedLocation = pos;
//                             controller.text = data["name"];
//                           });
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//
//           /// 🔴 CONTINUE BUTTON
//           Positioned(
//             bottom: 40,
//             left: 24,
//             child: SizedBox(
//               height: 45,
//               width: 240,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFEB4646),
//                 ),
//                 onPressed: () async {
//                   await saveLocation();
//                   Get.back(result: controller.text);
//                 },
//                 child: const Text("Continue"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart' as geo;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   Completer<GoogleMapController> mapController = Completer();
//
//   TextEditingController controller = TextEditingController();
//   List predictions = [];
//
//   LatLng initialPosition = const LatLng(31.5204, 74.3587);
//   LatLng? selectedLocation;
//
//   double? selectedLat;
//   double? selectedLng;
//
//   Future<void> getSuggestions(String input) async {
//     const apiKey = "AIzaSyC2JgccRMqweChAxeShHiLLaFnVLrPBe_I";
//
//     final url =
//         "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:pk";
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//
//       setState(() {
//         predictions = data['predictions'];
//       });
//     }
//   }
//
//   Future<void> moveToLocation(String place) async {
//     List<geo.Location> locations = await geo.locationFromAddress(place);
//
//     final loc = locations.first;
//
//     final pos = LatLng(loc.latitude, loc.longitude);
//
//     setState(() {
//       selectedLocation = pos;
//       selectedLat = loc.latitude;
//       selectedLng = loc.longitude;
//     });
//
//     final map = await mapController.future;
//
//     map.animateCamera(
//       CameraUpdate.newLatLngZoom(pos, 15),
//     );
//   }
//
//   Future<void> saveLocation(String name) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("saved_location", name);
//
//     await FirebaseFirestore.instance.collection("locations").add({
//       "name": name,
//       "lat": selectedLat,
//       "lng": selectedLng,
//       "createdAt": DateTime.now(),
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: initialPosition,
//               zoom: 14,
//             ),
//             onMapCreated: (c) => mapController.complete(c),
//             markers: {
//               if (selectedLocation != null)
//                 Marker(
//                   markerId: const MarkerId("sel"),
//                   position: selectedLocation!,
//                 )
//             },
//           ),
//
//           Positioned(
//             top: 46,
//             left: 24,
//             right: 24,
//             child: TextField(
//               controller: controller,
//               onChanged: getSuggestions,
//               decoration: InputDecoration(
//                 hintText: "Search Location",
//                 filled: true,
//                 fillColor: Colors.white,
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//
//           if (predictions.isNotEmpty)
//             Positioned(
//               top: 120,
//               left: 24,
//               right: 24,
//               child: Container(
//                 color: Colors.white,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: predictions.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(predictions[index]['description']),
//                       onTap: () async {
//                         String place = predictions[index]['description'];
//
//                         controller.text = place;
//                         predictions.clear();
//
//                         await moveToLocation(place);
//                         setState(() {});
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//           Positioned(
//             bottom: 40,
//             left: 24,
//             child: ElevatedButton(
//               onPressed: () async {
//                 await saveLocation(controller.text);
//                 Get.back(result: controller.text);
//               },
//               child: const Text("Continue"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Completer<GoogleMapController> mapController = Completer();

  TextEditingController controller = TextEditingController();

  List predictions = [];

  LatLng initialPosition = const LatLng(31.5204, 74.3587);

  LatLng? selectedLocation;
  double? selectedLat;
  double? selectedLng;

  final apiKey = "AIzaSyC2JgccRMqweChAxeShHiLLaFnVLrPBe_I";

  /// SEARCH
  Future<void> getSuggestions(String input) async {
    if (input.isEmpty) {
      setState(() => predictions = []);
      return;
    }

    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:pk";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        predictions = data['predictions'] ?? [];
      });
    }
  }

  /// MOVE MAP
  Future<void> moveToLocation(String place) async {
    List<geo.Location> locations =
    await geo.locationFromAddress(place);

    final loc = locations.first;

    final pos = LatLng(loc.latitude, loc.longitude);

    setState(() {
      selectedLocation = pos;
      selectedLat = loc.latitude;
      selectedLng = loc.longitude;
      controller.text = place;
    });

    final map = await mapController.future;

    map.animateCamera(
      CameraUpdate.newLatLngZoom(pos, 15),
    );
  }

  /// SAVE PER USER
  Future<void> saveLocation() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("locations")
        .doc(uid)
        .set({
      "name": controller.text,
      "lat": selectedLat,
      "lng": selectedLng,
      "createdAt": FieldValue.serverTimestamp(),
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("saved_location", controller.text);

    Get.back(result: {
      "location": controller.text,
      "lat": selectedLat,
      "lng": selectedLng,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// MAP
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 14,
            ),
            onMapCreated: (c) => mapController.complete(c),
            markers: {
              if (selectedLocation != null)
                Marker(
                  markerId: const MarkerId("selected"),
                  position: selectedLocation!,
                ),
            },
          ),

          /// SEARCH BOX
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: TextField(
              controller: controller,
              onChanged: getSuggestions,
              decoration: InputDecoration(
                hintText: "Search Location",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          /// SUGGESTIONS
          if (predictions.isNotEmpty)
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: predictions.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(predictions[i]['description']),
                      onTap: () {
                        moveToLocation(predictions[i]['description']);
                        setState(() => predictions = []);
                      },
                    );
                  },
                ),
              ),
            ),

          /// CONTINUE
          Positioned(
            bottom: 40,
            left: 20,
            child: ElevatedButton(
              onPressed: saveLocation,
              child: const Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart' as geo;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   Completer<GoogleMapController> mapController = Completer();
//
//   TextEditingController controller = TextEditingController();
//
//   List predictions = [];
//
//   LatLng initialPosition = const LatLng(31.5204, 74.3587);
//
//   LatLng? selectedLocation;
//   double? selectedLat;
//   double? selectedLng;
//
//   final apiKey = "AIzaSyC2JgccRMqweChAxeShHiLLaFnVLrPBe_I";
//
//   /// 🔍 AUTOCOMPLETE
//   Future<void> getSuggestions(String input) async {
//     if (input.isEmpty) {
//       setState(() => predictions = []);
//       return;
//     }
//
//     final url =
//         "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:pk";
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//
//       setState(() {
//         predictions = data['predictions'] ?? [];
//       });
//     }
//   }
//
//   /// 📍 MOVE MAP
//   Future<void> moveToLocation(String place) async {
//     List<geo.Location> locations =
//     await geo.locationFromAddress(place);
//
//     final loc = locations.first;
//
//     final pos = LatLng(loc.latitude, loc.longitude);
//
//     setState(() {
//       selectedLocation = pos;
//       selectedLat = loc.latitude;
//       selectedLng = loc.longitude;
//       controller.text = place;
//       predictions.clear();
//     });
//
//     final map = await mapController.future;
//
//     map.animateCamera(
//       CameraUpdate.newLatLngZoom(pos, 15),
//     );
//   }
//
//   /// 💾 SAVE
//   Future<void> saveLocation() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString("saved_location", controller.text);
//
//     await FirebaseFirestore.instance.collection("locations").add({
//       "name": controller.text,
//       "lat": selectedLat ?? 0,
//       "lng": selectedLng ?? 0,
//       "createdAt": FieldValue.serverTimestamp(),
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           /// 🗺️ MAP
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: initialPosition,
//               zoom: 14,
//             ),
//             onMapCreated: (c) => mapController.complete(c),
//             myLocationEnabled: true,
//             markers: {
//               if (selectedLocation != null)
//                 Marker(
//                   markerId: const MarkerId("selected"),
//                   position: selectedLocation!,
//                 ),
//             },
//           ),
//
//           /// 🔍 SEARCH BOX
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 controller: controller,
//                 onChanged: getSuggestions,
//                 decoration: const InputDecoration(
//                   hintText: "Search Location",
//                   prefixIcon: Icon(Icons.search),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.all(15),
//                 ),
//               ),
//             ),
//           ),
//
//           /// 📍 SUGGESTIONS
//           if (predictions.isNotEmpty)
//             Positioned(
//               top: 120,
//               left: 20,
//               right: 20,
//               child: Container(
//                 color: Colors.white,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: predictions.length,
//                   itemBuilder: (context, i) {
//                     return ListTile(
//                       title: Text(predictions[i]['description']),
//                       onTap: () {
//                         moveToLocation(
//                           predictions[i]['description'],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//           /// 🔴 CONTINUE BUTTON
//           Positioned(
//             bottom: 40,
//             left: 20,
//             child: ElevatedButton(
//               onPressed: () async {
//                 await saveLocation();
//
//                 Get.back(result: {
//                   "location": controller.text,
//                   "lat": selectedLat,
//                   "lng": selectedLng,
//                 });
//               },
//               child: const Text("Continue"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }