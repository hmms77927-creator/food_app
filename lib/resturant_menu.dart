import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/location_1.dart' hide Icon;
import 'package:flutter_application_appnexts/rating_1.dart';
import 'package:get/get.dart';

class ResturantMenu extends StatefulWidget {
  const ResturantMenu({super.key});

  @override
  State<ResturantMenu> createState() => _ResturantMenuState();
}
class _ResturantMenuState extends State<ResturantMenu> {
  late final Map data;
  @override
  void initState() {
    super.initState();
    data = Get.arguments ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700, // ✅ FIXED
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEB4646),

        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu_book, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: data['image'] != null
                        ? Image.file(
                      File(data['image']),
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'assats/image/ecaa5c0d4bd618634326e8c00080ab106a4c9206 (2).png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 120,
                    right: 120,
                    child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        'assats/image/70E73AC6-BF5C-4785-92A2-1F14DF657095 2.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 NAME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                data['name'] ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181C2E),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // 🔹 DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                data['description'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star, color: Color(0xFFEB4646)),
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('reviews').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('0.0 (0)');
                    }

                    final docs = snapshot.data!.docs;
                    int totalRatings = docs.length;

                    double avgRating = 0;

                    if (totalRatings > 0) {
                      double sum = 0;

                      for (var doc in docs) {
                        final data = doc.data() as Map<String, dynamic>;
                        sum += (data['rating'] ?? 0);
                      }

                      avgRating = sum / totalRatings;
                    }

                    return Row(
                      children: [
                        Text(
                          avgRating.toStringAsFixed(1),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 10),
                        Text('$totalRatings ratings'),
                      ],
                    );
                  },
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Rating1()),
                    );
                  },
                  child: const Text(
                    'See Reviews',
                    style: TextStyle(
                      color: Color(0xFFEB4646),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),

            // 🔹 OPENING / CLOSING
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Open: ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    data['opening'] ?? '',
                    style: const TextStyle(color: Colors.green),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Close: ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    data['closing'] ?? '',
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                data['description'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  SizedBox(
                    width: 220,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEB4646),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Moderate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => const Location1()),
                      // );
                    },
                    child: Image.asset('assats/image/Vector.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

