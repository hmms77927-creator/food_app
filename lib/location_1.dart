// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:flutter_application_appnexts/food_menu.dart';
//
// class Location1 extends StatefulWidget {
//   const Location1({super.key});
//
//   @override
//   State<Location1> createState() => _Location1State();
// }
//
// class _Location1State extends State<Location1> {
//   late GoogleMapController mapController;
//   final LatLng _center = const LatLng(31.5204, 74.3587);
//   LatLng? currentLocation;
//   LatLng? searchedLocation;
//   late final Map data;
//   TextEditingController searchController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     data = Get.arguments ?? {};
//     getCurrentLocation();
//   }
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//   Future<void> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) return;
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) return;
//     }
//     if (permission == LocationPermission.deniedForever) return;
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     setState(() {
//       currentLocation = LatLng(position.latitude, position.longitude);
//     });
//   }
//   Future<void> searchLocation(String place) async {
//     try {
//       List<Location> locations = await locationFromAddress(place);
//       Location loc = locations.first;
//       LatLng newPos = LatLng(loc.latitude, loc.longitude);
//       setState(() {
//         searchedLocation = newPos;
//       });
//
//       mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(target: newPos, zoom: 14),
//         ),
//       );
//     } catch (e) {
//       print("Location not found");
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     final imagePath = data['image'] ?? '';
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xFFEB4646),
//         leading: IconButton(
//           style: IconButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: CircleBorder(),
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios_new),
//         ),
//         title: SizedBox(
//           width: 300,
//           height: 45,
//           child: TextField(
//             controller: searchController,
//             onSubmitted: searchLocation,
//             decoration: InputDecoration(
//               hintText: "Search location",
//               prefixIcon: Icon(Icons.search),
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 14,
//             ),
//             markers: {
//               Marker(
//                 markerId: MarkerId("restaurant"),
//                 position: _center,
//                 infoWindow: InfoWindow(
//                   title: data['name'] ?? '',
//                   snippet: data['description'] ?? '',
//                 ),
//               ),
//               if (currentLocation != null)
//                 Marker(
//                   markerId: MarkerId("me"),
//                   position: currentLocation!,
//                   icon: BitmapDescriptor.defaultMarkerWithHue(
//                     BitmapDescriptor.hueBlue,
//                   ),
//                   infoWindow: InfoWindow(title: "My Location"),
//                 ),
//               if (searchedLocation != null)
//                 Marker(
//                   markerId: MarkerId("search"),
//                   position: searchedLocation!,
//                   icon: BitmapDescriptor.defaultMarkerWithHue(
//                     BitmapDescriptor.hueRed,
//                   ),
//                   infoWindow: InfoWindow(title: "Search Location"),
//                 ),
//             },
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             zoomGesturesEnabled: true,
//             rotateGesturesEnabled: true,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
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
//                                 : AssetImage('assats/image/default.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(data['name'] ?? '',
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                             Text(data['description'] ?? ''),
//                             Text("Open: ${data['opening'] ?? ''}",
//                                 style: TextStyle(color: Colors.green)),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0, top: 2),
//                         child: TextButton.icon(
//                           style: TextButton.styleFrom(
//                             backgroundColor: const Color(0xFFEB4646),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               side: const BorderSide(color: Color(0xFFEB4646)),
//                             ),
//                           ),
//                           onPressed: () {
//                             Get.to(FoodMenu());
//                           },
//                           icon: const Icon(Icons.menu_book, color: Colors.white),
//                           label: const Text('view menu', style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//
//                       FloatingActionButton(
//                         mini: true,
//                         onPressed: getCurrentLocation,
//                         child: Icon(Icons.my_location),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'food_menu.dart';

class Location1 extends StatefulWidget {
  const Location1({super.key});

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {

  GoogleMapController? mapController;

  late final Map data;

  TextEditingController searchController = TextEditingController();

  LatLng? currentLocation;
  LatLng? searchedLocation;
  LatLng? restaurantLocation;

  bool mapReady = false;

  @override
  void initState() {
    super.initState();
    data = Get.arguments ?? {};

    getCurrentLocation();
    loadRestaurantLocation();
  }

  // ================= MAP CREATED =================
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapReady = true;

    if (restaurantLocation != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(restaurantLocation!, 15),
      );
    }
  }

  // ================= CURRENT LOCATION =================
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  // ================= LOAD RESTAURANT LOCATION =================
  Future<void> loadRestaurantLocation() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('add_restaurant')
          .doc('userRestaurant')
          .get();

      if (doc.exists) {
        final d = doc.data() as Map<String, dynamic>;

        double? lat = d['lat'];
        double? lng = d['lng'];

        if (lat != null && lng != null) {
          setState(() {
            restaurantLocation = LatLng(lat, lng);
          });

          if (mapReady && mapController != null) {
            mapController!.animateCamera(
              CameraUpdate.newLatLngZoom(restaurantLocation!, 15),
            );
          }
        }
      }
    } catch (e) {
      print("Error loading location: $e");
    }
  }

  // ================= SEARCH LOCATION =================
  Future<void> searchLocation(String place) async {
    try {
      List<Location> locations = await locationFromAddress(place);
      Location loc = locations.first;

      setState(() {
        searchedLocation = LatLng(loc.latitude, loc.longitude);
      });

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(searchedLocation!, 14),
      );
    } catch (e) {
      Get.snackbar("Error", "Location not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = data['image'] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APPBAR =================
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
              ),
            ),
          ),
        ),
      ),

      // ================= BODY =================
      body: Stack(
        children: [

          // ================= GOOGLE MAP =================
          // GoogleMap(
          //   onMapCreated: _onMapCreated,
          //
          //   initialCameraPosition: CameraPosition(
          //     target: restaurantLocation ??
          //         const LatLng(31.5204, 74.3587),
          //     zoom: 14,
          //   ),
          //
          //   markers: {
          //
          //     // ⭐ RESTAURANT PIN (IMGE SCREEN LOCATION)
          //     if (restaurantLocation != null)
          //       Marker(
          //         markerId: const MarkerId("restaurant"),
          //         position: restaurantLocation!,
          //         infoWindow: InfoWindow(
          //           title: data['name'] ?? '',
          //           snippet: data['description'] ?? '',
          //         ),
          //       ),
          //
          //     // ⭐ CURRENT LOCATION
          //     if (currentLocation != null)
          //       Marker(
          //         markerId: const MarkerId("me"),
          //         position: currentLocation!,
          //         icon: BitmapDescriptor.defaultMarkerWithHue(
          //           BitmapDescriptor.hueBlue,
          //         ),
          //         infoWindow: const InfoWindow(title: "My Location"),
          //       ),
          //
          //     // ⭐ SEARCH LOCATION
          //     if (searchedLocation != null)
          //       Marker(
          //         markerId: const MarkerId("search"),
          //         position: searchedLocation!,
          //         icon: BitmapDescriptor.defaultMarkerWithHue(
          //           BitmapDescriptor.hueRed,
          //         ),
          //         infoWindow: const InfoWindow(title: "Search Location"),
          //       ),
          //   },
          //
          //   myLocationEnabled: true,
          //   myLocationButtonEnabled: true,
          //   zoomGesturesEnabled: true,
          // ),

          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('add_restaurant')
                .doc('userRestaurant')
                .snapshots(),

            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final data = snapshot.data!.data() as Map<String, dynamic>;

              LatLng restaurantLocation = LatLng(
                data['lat'] ?? 31.5204,
                data['lng'] ?? 74.3587,
              );

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: restaurantLocation,
                  zoom: 14,
                ),

                markers: {
                  Marker(
                    markerId: const MarkerId("restaurant"),
                    position: restaurantLocation,
                    infoWindow: InfoWindow(
                      title: data['name'] ?? '',
                      snippet: data['description'] ?? '',
                    ),
                  ),
                },
              );
            },
          ),
          // ================= BOTTOM CARD =================
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFEB4646),
                        ),
                        onPressed: () {
                          Get.to(() => FoodMenu());
                        },
                        icon: const Icon(Icons.menu_book, color: Colors.white),
                        label: const Text(
                          'view menu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      FloatingActionButton(
                        mini: true,
                        onPressed: getCurrentLocation,
                        child: const Icon(Icons.my_location),
                      ),
                    ],
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