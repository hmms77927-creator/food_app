import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;

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
  Future<void> moveToLocation(String place) async {
    try {
      List<geo.Location> locations =
      await geo.locationFromAddress(place);

      if (locations.isEmpty) return;

      final loc = locations.first;

      final pos = LatLng(loc.latitude, loc.longitude);

      setState(() {
        selectedLocation = pos;
        selectedLat = loc.latitude;
        selectedLng = loc.longitude;
        controller.text = place;
        predictions = [];
      });

      final map = await mapController.future;

      map.animateCamera(
        CameraUpdate.newLatLngZoom(pos, 15),
      );
    } catch (e) {
      Get.snackbar("Error", "Location not found");
    }
  }

  void confirmLocation() {
    if (selectedLat == null || selectedLng == null) {
      Get.snackbar("Error", "Please select a location first");
      return;
    }
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
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              mapController.complete(controller);
            },
            markers: {
              if (selectedLocation != null)
                Marker(
                  markerId: const MarkerId("selected"),
                  position: selectedLocation!,
                ),
            },
          ),
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
                      },
                    );
                  },
                ),
              ),
            ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: ElevatedButton(
    style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFEB4646),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Color(0xFFEB4646)),
                    ),
                  ),
              onPressed: confirmLocation,
              child: const Text("Confirm Location",
    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: .w700,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
