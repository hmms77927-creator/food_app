import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
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

  LatLng? searchedLocation;

  Future<void> searchLocation(String place) async {
    try {
      List<geo.Location> locations =
      await geo.locationFromAddress(place);

      if (locations.isEmpty) return;

      final loc = locations.first;

      final newPosition = LatLng(loc.latitude, loc.longitude);

      setState(() {
        searchedLocation = newPosition;
      });

      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: newPosition,
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      Get.snackbar("Error", "Location not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};
    final imagePath = data['image'] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
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
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          /// ---------------- MAP ----------------
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('add_restaurant')
                .doc('userRestaurant')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: CircularProgressIndicator());
              }

              final firebaseData =
              snapshot.data!.data() as Map<String, dynamic>;

              final LatLng position = LatLng(
                (firebaseData['lat'] ?? 31.5204).toDouble(),
                (firebaseData['lng'] ?? 74.3587).toDouble(),
              );

              return GoogleMap(
                onMapCreated: (c) => mapController = c,
                initialCameraPosition: CameraPosition(
                  target: position,
                  zoom: 14,
                ),
                markers: {
                  /// Restaurant marker
                  Marker(
                    markerId: const MarkerId("restaurant"),
                    position: position,
                    infoWindow: InfoWindow(
                      title: firebaseData['name'] ?? '',
                      snippet: firebaseData['location'] ?? '',
                    ),
                  ),

                  /// Search marker
                  if (searchedLocation != null)
                    Marker(
                      markerId: const MarkerId("search"),
                      position: searchedLocation!,
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      ),
                      infoWindow:
                      const InfoWindow(title: "Search Location"),
                    ),
                },
              );
            },
          ),

          /// ---------------- BOTTOM PANEL ----------------
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('add_restaurant')
                                .doc('userRestaurant')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData ||
                                  !snapshot.data!.exists) {
                                return const SizedBox();
                              }

                              final data = snapshot.data!.data()
                              as Map<String, dynamic>;

                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      data['location'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    /// MENU BUTTON
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextButton.icon(
                    //       style: TextButton.styleFrom(
                    //         backgroundColor: const Color(0xFFEB4646),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           side: const BorderSide(
                    //             color: Color(0xFFEB4646),
                    //           ),
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         Get.to(() => FoodMenu());
                    //       },
                    //       icon: const Icon(
                    //         Icons.menu_book,
                    //         color: Colors.white,
                    //       ),
                    //       label: const Text(
                    //         'view menu',
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: Column(
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
    Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text(
    data['name'] ?? '',
    style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    Text(data['description'] ?? ''),
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
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton.icon(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFEB4646),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Color(0xFFEB4646),
                                    ),
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
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
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
//   LatLng? passedLocation;
//   String address = "";
//
//   @override
//   void initState() {
//     super.initState();
//
//     final args = Get.arguments ?? {};
//
//     if (args != null) {
//       passedLocation = LatLng(args['lat'], args['lng']);
//       address = args['address'] ?? "";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('add_restaurant')
//             .doc('userRestaurant')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final data = snapshot.data!.data() as Map<String, dynamic>;
//
//           final position = passedLocation ??
//               LatLng(
//                 (data['lat'] ?? 31.5204),
//                 (data['lng'] ?? 74.3587),
//               );
//
//           return Stack(
//             children: [
//               GoogleMap(
//                 onMapCreated: (c) => mapController = c,
//                 initialCameraPosition: CameraPosition(
//                   target: position,
//                   zoom: 14,
//                 ),
//                 markers: {
//                   Marker(
//                     markerId: const MarkerId("restaurant"),
//                     position: position,
//                   ),
//                 },
//               ),
//
//               /// BOTTOM PANEL
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 200,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Text(address),
//                       ElevatedButton(
//                         onPressed: () {
//                           Get.to(() => FoodMenu());
//                         },
//                         child: const Text("Menu"),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }