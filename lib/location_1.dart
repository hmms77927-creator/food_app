// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geocoding/geocoding.dart' as geo;
// import 'food_menu.dart';
//
// class Location1 extends StatefulWidget {
//   const Location1({super.key});
//
//   @override
//   State<Location1> createState() => _Location1State();
// }
//
// class _Location1State extends State<Location1> {
//   GoogleMapController? mapController;
//
//   TextEditingController searchController = TextEditingController();
//
//   LatLng? searchedLocation;
//
//   Future<void> searchLocation(String place) async {
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
//         searchedLocation = newPosition;
//       });
//
//       mapController?.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: newPosition,
//             zoom: 15,
//           ),
//         ),
//       );
//     } catch (e) {
//       Get.snackbar("Error", "Location not found");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = Get.arguments ?? {};
//     final imagePath = data['image'] ?? '';
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFEB4646),
//         leading: IconButton(
//           style: IconButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: const CircleBorder(),
//           ),
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//         title: SizedBox(
//           height: 45,
//           child: TextField(
//             controller: searchController,
//             onSubmitted: searchLocation,
//             decoration: InputDecoration(
//               hintText: "Search location",
//               prefixIcon: const Icon(Icons.search),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//
//       body: Stack(
//         children: [
//           /// ---------------- MAP ----------------
//           StreamBuilder<DocumentSnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection('add_restaurant')
//                 .doc('userRestaurant')
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData || !snapshot.data!.exists) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               final firebaseData =
//               snapshot.data!.data() as Map<String, dynamic>;
//
//               final LatLng position = LatLng(
//                 (firebaseData['lat'] ?? 31.5204).toDouble(),
//                 (firebaseData['lng'] ?? 74.3587).toDouble(),
//               );
//
//               return GoogleMap(
//                 onMapCreated: (c) => mapController = c,
//                 initialCameraPosition: CameraPosition(
//                   target: position,
//                   zoom: 14,
//                 ),
//                 markers: {
//                   /// Restaurant marker
//                   Marker(
//                     markerId: const MarkerId("restaurant"),
//                     position: position,
//                     infoWindow: InfoWindow(
//                       title: firebaseData['name'] ?? '',
//                       snippet: firebaseData['location'] ?? '',
//                     ),
//                   ),
//
//                   /// Search marker
//                   if (searchedLocation != null)
//                     Marker(
//                       markerId: const MarkerId("search"),
//                       position: searchedLocation!,
//                       icon: BitmapDescriptor.defaultMarkerWithHue(
//                         BitmapDescriptor.hueRed,
//                       ),
//                       infoWindow:
//                       const InfoWindow(title: "Search Location"),
//                     ),
//                 },
//               );
//             },
//           ),
//
//           /// ---------------- BOTTOM PANEL ----------------
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               width: double.infinity,
//               height: 200,
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: StreamBuilder<DocumentSnapshot>(
//                             stream: FirebaseFirestore.instance
//                                 .collection('add_restaurant')
//                                 .doc('userRestaurant')
//                                 .snapshots(),
//                             builder: (context, snapshot) {
//                               if (!snapshot.hasData ||
//                                   !snapshot.data!.exists) {
//                                 return const SizedBox();
//                               }
//
//                               final data = snapshot.data!.data()
//                               as Map<String, dynamic>;
//
//                               return Padding(
//                                 padding:
//                                 const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       data['location'] ?? '',
//                                       style: const TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 width: 120,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   image: DecorationImage(
//                                     image: imagePath != ''
//                                         ? FileImage(File(imagePath))
//                                         : const AssetImage(
//                                       'assats/image/default.png',
//                                     ) as ImageProvider,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//     Padding(
//     padding:
//     const EdgeInsets.symmetric(horizontal: 8),
//     child: Column(
//     crossAxisAlignment:
//     CrossAxisAlignment.start,
//     children: [
//     Text(
//     data['name'] ?? '',
//     style: const TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     Text(data['description'] ?? ''),
//     Text(
//     "Open: ${data['opening'] ?? ''}",
//     style: const TextStyle(
//     color: Colors.green,
//     ),
//     ),
//     ],
//     ),
//     ),
//                             ],
//                           ),
//                           Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextButton.icon(
//                                 style: TextButton.styleFrom(
//                                   backgroundColor: const Color(0xFFEB4646),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     side: const BorderSide(
//                                       color: Color(0xFFEB4646),
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   Get.to(() => FoodMenu());
//                                 },
//                                 icon: const Icon(
//                                   Icons.menu_book,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   'view menu',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_places_flutter/model/place_details.dart' as geo;
//
// import 'food_menu.dart';
//
// class Location1 extends StatefulWidget {
//   const Location1({super.key});
//
//   @override
//   State<Location1> createState() => _Location1State();
// }
//
// class _Location1State extends State<Location1> {
//   TextEditingController searchController = TextEditingController();
//
//   GoogleMapController? mapController;
//
//   LatLng? currentPos;
//
//   void moveCamera(LatLng pos) {
//     mapController?.animateCamera(
//       CameraUpdate.newLatLngZoom(pos, 16),
//     );
//   }
//
//   LatLng? searchedLocation;
//
//   Future<void> searchLocation(String place) async {
//     try {
//       var locations =
//       await geo.locationFromAddress(place);
//
//       if (locations.isEmpty) return;
//
//       final loc = locations.first;
//
//       final newPosition = LatLng(loc.latitude, loc.longitude);
//
//       setState(() {
//         searchedLocation = newPosition;
//       });
//
//       mapController?.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: newPosition,
//             zoom: 15,
//           ),
//         ),
//       );
//     } catch (e) {
//       Get.snackbar("Error", "Location not found");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//         final data = Get.arguments ?? {};
//     final imagePath = data['image'] ?? '';
//     return Scaffold(
//             backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFEB4646),
//         leading: IconButton(
//           style: IconButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: const CircleBorder(),
//           ),
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//         title: SizedBox(
//           height: 45,
//           child: TextField(
//             controller: searchController,
//             onSubmitted: searchLocation,
//             decoration: InputDecoration(
//               hintText: "Search location",
//               prefixIcon: const Icon(Icons.search),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("locations")
//                 .orderBy("createdAt", descending: true)
//                 .limit(1)
//                 .snapshots(),
//             builder: (context, snapshot) {
//
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               final docs = snapshot.data!.docs;
//
//               if (docs.isEmpty) {
//                 return const Center(child: Text("No Location Found"));
//               }
//
//               final data = docs.first.data() as Map<String, dynamic>;
//
//               final double lat = (data["lat"] ?? 0).toDouble();
//               final double lng = (data["lng"] ?? 0).toDouble();
//
//               final LatLng newPos = LatLng(lat, lng);
//
//               /// 🔥 AUTO MOVE CAMERA
//               if (currentPos == null || currentPos != newPos) {
//                 currentPos = newPos;
//
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   moveCamera(newPos);
//                 });
//               }
//
//               return Stack(
//                 children: [
//
//                   /// 🗺️ GOOGLE MAP
//                   GoogleMap(
//                     onMapCreated: (c) {
//                       mapController = c;
//
//                       if (currentPos != null) {
//                         moveCamera(currentPos!);
//                       }
//                     },
//                     initialCameraPosition: CameraPosition(
//                       target: newPos,
//                       zoom: 15,
//                     ),
//                     markers: {
//                       Marker(
//                         markerId: const MarkerId("location"),
//                         position: newPos,
//                         infoWindow: InfoWindow(
//                           title: (data["name"] ?? "").toString(),
//                           snippet: (data["location"] ?? "").toString(),
//                         ),
//                       ),
//                     },
//                   ),
//
//                   /// 📦 UI (SAME AS YOURS)
//                   // Align(
//                   //   alignment: Alignment.bottomLeft,
//                   //   child: Container(
//                   //     width: double.infinity,
//                   //     height: 200,
//                   //     color: Colors.white,
//                   //     child: Column(
//                   //       children: [
//                   //         Text((data["location"] ?? "").toString()),
//                   //         Text((data["name"] ?? "").toString()),
//                   //         Text((data["description"] ?? "").toString()),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               );
//             },
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: 120,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           image: DecorationImage(
//                             image: imagePath != ''
//                                 ? FileImage(File(imagePath))
//                                 : const AssetImage(
//                               'assats/image/default.png',
//                             ) as ImageProvider,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                         const EdgeInsets.symmetric(horizontal: 8),
//                         child: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               data['name'] ?? '',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(data['description'] ?? ''),
//                             Text(
//                               "Open: ${data['opening'] ?? ''}",
//                               style: const TextStyle(
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextButton.icon(
//                         style: TextButton.styleFrom(
//                           backgroundColor: const Color(0xFFEB4646),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: const BorderSide(
//                               color: Color(0xFFEB4646),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           Get.to(() => FoodMenu());
//                         },
//                         icon: coimport 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// //                           Icons.menu_book,
// //                           color: Colors.white,
// //                         ),
// //                         label: const Text(
// //                           'view menu',
// //                           style: TextStyle(color: Colors.white),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
//
//   class Location1 extends StatefulWidget {
//   const Location1({super.key});
//
//   @override
//   State<Location1> createState() => _Location1State();
// }
//
// class _Location1State extends State<Location1> {
//   GoogleMapController? mapController;
//   LatLng? searchedLocation;
//
//   Map<String, dynamic> data = {};
//
//   @override
//   void initState() {
//     super.initState();
//     data = (Get.arguments ?? {}) as Map<String, dynamic>;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // 🔥 PER CARD LOCATION
//     final double? lat = data["lat"];
//     final double? lng = data["lng"];
//
//     // ⚠️ safety check
//     if (lat == null || lng == null) {
//       return Scaffold(
//         body: Center(child: Text("Location not available")),
//       );
//     }
//
//     final LatLng position = LatLng(lat, lng);
//
//     return Scaffold(
//       appBar: AppBar(title: Text(data["name"] ?? "")),
//
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: position,
//               zoom: 14,
//             ),
//             onMapCreated: (c) => mapController = c,
//             markers: {
//               Marker(
//                 markerId: MarkerId("main"),
//                 position: position,
//               ),
//
//               if (searchedLocation != null)
//                 Marker(
//                   markerId: MarkerId("search"),
//                   position: searchedLocation!,
//                 ),
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class Location1 extends StatefulWidget {
//   const Location1({super.key});
//
//   @override
//   State<Location1> createState() => _Location1State();
// }
//
// class _Location1State extends State<Location1> {
//   GoogleMapController? mapController;
//
//   Map<String, dynamic> data = {};
//
//   @override
//   void initState() {
//     super.initState();
//     data = (Get.arguments ?? {}) as Map<String, dynamic>;
//   }
//
//   void moveCamera(LatLng pos) {
//     mapController?.animateCamera(
//       CameraUpdate.newLatLngZoom(pos, 16),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double lat = (data["lat"] ?? 31.5204).toDouble();
//     final double lng = (data["lng"] ?? 74.3587).toDouble();
//
//     final LatLng pos = LatLng(lat, lng);
//
//     return Scaffold(
//       appBar: AppBar(title: Text(data["name"] ?? "")),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: pos,
//           zoom: 14,
//         ),
//         onMapCreated: (c) {
//           mapController = c;
//         },
//         markers: {
//           Marker(
//             markerId: MarkerId(data["name"] ?? "rest"),
//             position: pos,
//           ),
//         },
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart' as geo;

import 'food_menu.dart';

class Location1 extends StatefulWidget {
  const Location1({super.key});

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  GoogleMapController? mapController;

  TextEditingController searchController = TextEditingController();

  LatLng? currentPos;

  /// SAFE ARGUMENTS
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    data = (Get.arguments ?? {}) as Map<String, dynamic>;

    searchController.text = (data["location"] ?? "").toString();
  }

  void moveCamera(LatLng pos) {
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(pos, 16),
    );
  }

  LatLng? searchedLocation;

  /// SEARCH FUNCTION
  Future<void> searchLocation(String place) async {
    try {
      if (place.isEmpty) return;

      List<geo.Location> locations =
      await geo.locationFromAddress(place);

      if (locations.isEmpty) return;

      final loc = locations.first;

      final newPosition = LatLng(loc.latitude, loc.longitude);

      setState(() {
        searchedLocation = newPosition;
      });

      moveCamera(newPosition);
    } catch (e) {
      Get.snackbar("Error", "Location not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = data['image'] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,

      /// ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: const Color(0xFFEB4646),
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: SizedBox(
          height: 45,
          child: TextField(
            controller: searchController,
            onSubmitted: searchLocation,
            decoration: InputDecoration(
              hintText: "Search location",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),

      /// ================= BODY =================
      body: Stack(
        children: [
          /// 🗺️ MAP
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("locations")
                .orderBy("createdAt", descending: true)
                .limit(1)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final docs = snapshot.data!.docs;

              if (docs.isEmpty) {
                return const Center(child: Text("No Location Found"));
              }

              final mapData =
              docs.first.data() as Map<String, dynamic>;

              final double lat =
              (mapData["lat"] ?? 31.5204).toDouble();
              final double lng =
              (mapData["lng"] ?? 74.3587).toDouble();

              final LatLng newPos = LatLng(lat, lng);

              /// FIRST TIME CAMERA MOVE ONLY
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (currentPos == null) {
                  currentPos = newPos;
                  moveCamera(newPos);
                }
              });

              return GoogleMap(
                onMapCreated: (c) {
                  mapController = c;

                  if (currentPos != null) {
                    moveCamera(currentPos!);
                  }
                },
                initialCameraPosition: CameraPosition(
                  target: newPos,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("location"),
                    position: newPos,
                    infoWindow: InfoWindow(
                      title: (mapData["name"] ?? "").toString(),
                      snippet:
                      (mapData["location"] ?? "").toString(),
                    ),
                  ),
                  if (searchedLocation != null)
                    Marker(
                      markerId: const MarkerId("search"),
                      position: searchedLocation!,
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      ),
                    ),
                },
              );
            },
          ),

          /// ================= BOTTOM UI (UNCHANGED) =================
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: imagePath != ''
                                ? FileImage(File(imagePath))
                                : const AssetImage(
                              'assats/image/default.png',
                            ) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data['name'] ?? '').toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (data['description'] ?? '')
                                  .toString(),
                            ),
                            Text(
                              "Open: ${data['opening'] ?? ''}",
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFEB4646),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => FoodMenu());
                      },
                      icon: const Icon(
                        Icons.menu_book,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'view menu',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
