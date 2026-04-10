import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/dra_home.dart';
import 'package:flutter_application_appnexts/favorate.dart';
import 'package:flutter_application_appnexts/location_1.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';
import 'package:get/get.dart';
import 'Models/model_users.dart';

class HomeV1 extends StatefulWidget {
  const HomeV1({super.key});

  @override
  State<HomeV1> createState() => _HomeV1State();
}

class _HomeV1State extends State<HomeV1> {
  TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DraHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ===== HEADER STACK =====
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEB4646),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 50),
                      bottomRight: Radius.elliptical(200, 50),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFECF0F4),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu, color: Colors.black),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deliver to',
                                style: TextStyle(
                                  color: Color(0xFFEB4646),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'Halal Lab office',
                                      style: TextStyle(
                                        color: Color(0xFF676767),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down, color: Color(0xFF676767)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Hey Leo, ',
                                      style: TextStyle(
                                        color: Color(0xFF1E1D1D),
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Good Afternoon!',
                                      style: TextStyle(
                                        color: Color(0xFF1E1D1D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  top: 170,
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value){setState(() {

                      });},
                      decoration: InputDecoration(
                        hintText: 'Search dishes, restaurants',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF676767),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== Categories Row =====
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'All Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Text(
                  'See All ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Icon(Icons.arrow_back_ios, color: Colors.black),
                Icon(Icons.arrow_forward_ios, color: Colors.black),
              ],
            ),
            const SizedBox(height: 10),

            // ===== Categories List =====
            Card(
              elevation: 4,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // All Button
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEB4646),
                              borderRadius: BorderRadius.circular(39),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                  color: Color(0xFFEFE6E1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundImage: AssetImage(
                                    'assats/image/34f428e47c8da57a9f796e1596d68f1688fa073a.png',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'All',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Hot Dog Button
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(39),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    color: Colors.black.withOpacity(0.15),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage: AssetImage(
                                      'assats/image/30fc202b681cf552fb8011ec1be440edbee3f301.png',
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Hot Dog',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Burger Button
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(39),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage: AssetImage(
                                      'assats/image/cbd8173438dd01c6f5e642f129e262e385c4d0cc.png',
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Burger',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ===== Recommended Header =====
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended for you ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ===== StreamBuilder for Restaurants =====
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('add_restaurant').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No Data Found"));
                }

                final docs = snapshot.data!.docs;


                // ✅ FILTER
                final filteredDocs = docs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;

                  final name = (data['name'] ?? '').toLowerCase();
                  final description = (data['description'] ?? '').toLowerCase();
                  final query = searchController.text.toLowerCase();

                  return name.contains(query) || description.contains(query);
                }).toList();

                if (filteredDocs.isEmpty) {
                  return const Center(child: Text("No Data Found"));
                }

                return ListView.builder(
                  itemCount: filteredDocs.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = filteredDocs[index].data() as Map<String, dynamic>;
                    final String name = data['name'] ?? '';
                    final String description = data['description'] ?? '';
                    final String opening = data['opening'] ?? '';
                    final String closing = data['closing'] ?? '';
                    final String imagePath = data['image_path'] ?? '';

                    return Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Restaurant info row
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 93,
                                  height: 69,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: imagePath != ''
                                          ? FileImage(File(imagePath)) as ImageProvider
                                          : const AssetImage(
                                          'assats/image/ecaa5c0d4bd618634326e8c00080ab106a4c9206.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      color: Color(0xFF181C2E),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    description,
                                    style: const TextStyle(
                                      color: Color(0xFFA0A5BA),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Open Close + Favorite
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Open :', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                              ),
                              Text(' $opening  ',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.green)),
                              const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text('Close :', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                              ),
                              Text(' $closing  ',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.red)),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.favorite_border, color: Color(0xFFEB4646)),
                                onPressed: () {
                                  final dataFav = FavourateItem(
                                    resturantname: name,
                                    description: description,
                                    opening: opening,
                                    closing: closing,
                                    imagePath: imagePath,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Favorate(items: [dataFav]),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          // Buttons row
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, top: 0),
                                child: SizedBox(
                                  width: 116,
                                  height: 35,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(color: Color(0xFFEB4646)),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(() => const ResturantMenu(), arguments: {
                                        'name': name,
                                        'description': description,
                                        'opening': opening,
                                        'closing': closing,
                                        'image': imagePath,
                                      });
                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>ResturantMenu()) );
                                    },
                                    child: const Text('Moderate',
                                        style: TextStyle(color: Color(0xFFEB4646), fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, top: 2),
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFEB4646),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color: Color(0xFFEB4646)),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(() => const ResturantMenu(), arguments: {
                                      'name': name,
                                      'description': description,
                                      'opening': opening,
                                      'closing': closing,
                                      'image': imagePath,
                                    });
                                  },
                                  icon: const Icon(Icons.menu_book, color: Colors.white),
                                  label: const Text('view menu', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(Location1(),arguments:{
                                      'name':name,
                                      'description':description,
                                      'opening':opening,
                                      'image':imagePath,
                                    } );
                                  //   Navigator.push(
                                  //       context, MaterialPageRoute(builder: (context) => const Location1()));
                                  },
                                  child: Image.asset('assats/image/Vector.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

