import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String imagePath = '';

  final uid = FirebaseAuth.instance.currentUser!.uid;

  double lat = 0.0;
  double lng = 0.0;

  @override
  void initState() {
    super.initState();
    loadData();
    loadSavedLocation();
  }

  /// 📍 LOAD SAVED LOCATION
  Future<void> loadSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    String? loc = prefs.getString("saved_location");

    if (loc != null) {
      setState(() {
        locationController.text = loc;
      });
    }
  }

  /// 🖼 PICK IMAGE
  Future pickImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);

    if (img != null) {
      setState(() {
        imagePath = img.path;
      });
    }
  }

  /// ☁️ LOAD DATA
  Future loadData() async {
    final doc = await FirebaseFirestore.instance
        .collection('add_restaurant')
        .doc(uid)
        .get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;

      setState(() {
        nameController.text = data["name"] ?? "";
        descController.text = data["description"] ?? "";
        openController.text = data["opening"] ?? "";
        closeController.text = data["closing"] ?? "";
        locationController.text = data["location"] ?? "";
        imagePath = data["image_path"] ?? "";
        lat = (data["lat"] ?? 0).toDouble();
        lng = (data["lng"] ?? 0).toDouble();
      });
    }
  }
  Future saveData() async {
    await FirebaseFirestore.instance
        .collection('add_restaurant')
        .doc(uid)
        .set({
      "name": nameController.text,
      "description": descController.text,
      "opening": openController.text,
      "closing": closeController.text,
      "location": locationController.text,
      "image_path": imagePath,
      "uid": uid,
      "lat": lat,
      "lng": lng,
      "rating": 0,
      "totalReviews": 0,
      "createdAt": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("saved_location", locationController.text);

    Get.snackbar("Success", "Saved Successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
        backgroundColor: const Color(0xFFEB4646),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// 🖼 IMAGE PICKER
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: imagePath.isEmpty
                      ? const Center(child: Text("Pick Image"))
                      : Image.file(File(imagePath), fit: BoxFit.cover),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: descController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: openController,
                decoration: const InputDecoration(
                  labelText: "Open",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: closeController,
                decoration: const InputDecoration(
                  labelText: "Close",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),
              TextField(
                controller: locationController,
                readOnly: true,
                onTap: () async {
                  final result = await Get.to(() => const SearchScreen());

                  if (result != null) {
                    setState(() {
                      locationController.text = result["location"];
                      lat = result["lat"];
                      lng = result["lng"];
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Search Location",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEB4646),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 12,
                  ),
                ),
                onPressed: saveData,
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
