import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;

import 'food_menu.dart';

class Location1 extends StatefulWidget {
  const Location1({super.key});

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  TextEditingController searchController = TextEditingController();

  GoogleMapController? mapController;

  late Map<String, dynamic> data;

  LatLng? searchedLocation;

  @override
  void initState() {
    super.initState();
    data = Get.arguments ?? {};
  }

  void moveCamera(LatLng pos) {
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(pos, 15),
    );
  }

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

    final double lat =
        double.tryParse(data["lat"].toString()) ?? 31.5204;
    final double lng =
        double.tryParse(data["lng"].toString()) ?? 74.3587;

    final LatLng pos = LatLng(lat, lng);

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
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: pos,
              zoom: 14,
            ),

            onMapCreated: (controller) {
              mapController = controller;
              moveCamera(pos);
            },
            markers: {
              Marker(
                markerId: const MarkerId("selected"),
                position: searchedLocation ?? pos,
                infoWindow: InfoWindow(
                  title: data["name"],
                  snippet: data["description"],
                ),
              ),
            },
          ),
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
                            )
                            as ImageProvider,
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
                              (data['name'] ?? '').toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (data['description'] ?? '').toString(),
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

