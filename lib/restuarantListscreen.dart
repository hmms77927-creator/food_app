import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';
import 'package:get/get.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurants"),
        backgroundColor: const Color(0xFFEB4646),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('add_restaurant')
            .snapshots(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Restaurants Found"));
          }

          var docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {

              var d = docs[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: (d['image_path'] ?? '').isNotEmpty
                      ? Image.network(d['image_path'], width: 60, fit: BoxFit.cover)
                      : const Icon(Icons.image),

                  title: Text(d['name'] ?? ''),
                  subtitle: Text(d['location'] ?? ''),

                  onTap: () {
                    final name = d['name'] ?? '';

                    if (name.isEmpty) {
                      Get.snackbar("Error", "Restaurant name missing");
                      return;
                    }

                    Get.to(() => const ResturantMenu(), arguments: {
                      "name": name,
                      "image": d['image_path'] ?? '',
                      "description": d['description'] ?? '',
                      "opening": d['opening'] ?? '',
                      "closing": d['closing'] ?? '',
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}