// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'Models/model_users.dart';
// import 'location_1.dart';
// import 'resturant_menu.dart';
// import 'update_1.dart';
// import 'dra_home.dart';
//
// class HomeV1 extends StatefulWidget {
//   const HomeV1({super.key});
//
//   @override
//   State<HomeV1> createState() => _HomeV1State();
// }
//
// class _HomeV1State extends State<HomeV1> {
//   final uid = FirebaseAuth.instance.currentUser?.uid;
//   String getGreeting() {
//     final hour = DateTime.now().hour;
//
//     if (hour >= 5 && hour < 12) {
//       return "Good Morning!";
//     } else if (hour >= 12 && hour < 17) {
//       return "Good Afternoon!";
//     } else if (hour >= 17 && hour < 21) {
//       return "Good Evening!";
//     } else {
//       return "Good Night!";
//     }
//   }
//   List<FavourateItem> favoriteList = [];
//   final String favKey = "favorite_list";
//
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     loadFavorites();
//   }
//
//   Future<void> saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     List<String> data = favoriteList.map((item) {
//       return "${item.resturantname}||${item.description}||${item.opening}||${item.closing}||${item.imagePath ?? ''}";
//     }).toList();
//
//     await prefs.setStringList(favKey, data);
//   }
//
//   Future<void> loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getStringList(favKey);
//
//     if (data != null) {
//       favoriteList = data.map((e) {
//         final p = e.split("||");
//
//         return FavourateItem(
//           resturantname: p[0],
//           description: p[1],
//           opening: p[2],
//           closing: p[3],
//           imagePath: p.length > 4 ? p[4] : '',
//         );
//       }).toList();
//
//       setState(() {});
//     }
//   }
//
//   bool isFavorite(String name) {
//     return favoriteList.any((e) => e.resturantname == name);
//   }
//
//
//   void toggleFavorite(FavourateItem item) {
//     setState(() {
//       final exists = favoriteList.any(
//             (e) => e.resturantname == item.resturantname,
//       );
//
//       if (exists) {
//         favoriteList.removeWhere(
//               (e) => e.resturantname == item.resturantname,
//         );
//       } else {
//         favoriteList.add(item);
//       }
//     });
//
//     saveFavorites();
//   }
//
//   final ScrollController _scrollController = ScrollController();
//   bool showAll = false;
//
//   void scrollLeft() {
//     _scrollController.animateTo(
//       _scrollController.offset - 120,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.ease,
//     );
//   }
//
//   void scrollRight() {
//     _scrollController.animateTo(
//       _scrollController.offset + 100,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.ease,
//     );
//   }
//
//   void toggleSeeAll() {
//     setState(() {
//       showAll = !showAll;
//     });
//   }
//
//   Widget categoryItem(String title, String image, bool selected) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 6),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: selected ? Color(0xFFEB4646) : Colors.white,
//         borderRadius: BorderRadius.circular(39),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//           )
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CircleAvatar(
//             radius: 20,
//             backgroundImage: AssetImage(image),
//           ),
//           SizedBox(width: 6),
//           Flexible(
//             child: Text(
//               title,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: selected ? Colors.white : Colors.black,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: DraHome(
//         restaurantId: doc.id, // ✅ MUST PASS
//       ),
//         floatingActionButton: FloatingActionButton(
//         backgroundColor:  Colors.white,
//         child: const Icon(Icons.favorite,color:Color(0xFFEB4646),),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => FavoriteScreen(items: favoriteList),
//             ),
//           );
//         },
//       ),
//       body: Column(
//         children: [
//           Stack(
//                   children: [
//                     Container(
//                       height: 250,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFEB4646),
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.elliptical(200, 50),
//                           bottomRight: Radius.elliptical(200, 50),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 40,
//                       left: 20,
//                       right: 20,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 10,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Builder(
//                               builder: (context) => IconButton(
//                                 style: IconButton.styleFrom(
//                                   backgroundColor: const Color(0xFFECF0F4),
//                                   shape: const CircleBorder(),
//                                 ),
//                                 onPressed: () {
//                                   Scaffold.of(context).openDrawer();
//                                 },
//                                 icon: const Icon(Icons.menu, color: Colors.black),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Deliver to',
//                                     style: TextStyle(
//                                       color: Color(0xFFEB4646),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       StreamBuilder<DocumentSnapshot>(
//                                         stream: FirebaseFirestore.instance
//                                             .collection('add_restaurant')
//                                             .doc(uid)
//                                             .snapshots(),
//                                         builder: (context, snapshot) {
//
//                                           if (!snapshot.hasData || !snapshot.data!.exists) {
//                                             return const Text("No Restaurant");
//                                           }
//
//                                           final data = snapshot.data!.data() as Map<String, dynamic>;
//                                           final name = data['name'] ?? '';
//
//                                           return Text(
//                                             name,
//                                             style: const TextStyle(
//                                               color: Color(0xFF181C2E),
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 22,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                       const Icon(Icons.arrow_drop_down, color: Color(0xFF676767)),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 5),
//                                   RichText(
//                                     text: TextSpan(
//                                       children: [
//                                         const TextSpan(
//                                           text: 'Hey Leo, ',
//                                           style: TextStyle(
//                                             color: Color(0xFF1E1D1D),
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text: getGreeting(),
//                                           style: const TextStyle(
//                                             color: Color(0xFF1E1D1D),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             const CircleAvatar(
//                               radius: 30,
//                               backgroundImage: AssetImage(
//                                 'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 20,
//                       right: 20,
//                       top: 170,
//                       child: SizedBox(
//                         height: 45,
//                         child: TextField(
//                           controller: searchController,
//                           onChanged: (value){setState(() {
// searchController.text=value.toLowerCase();
// searchController.selection=TextSelection.fromPosition(TextPosition(offset: searchController.text.length));
//                           });},
//                           decoration: InputDecoration(
//                             hintText: 'Search dishes, restaurants',
//                             hintStyle: const TextStyle(
//                               fontSize: 14,
//                               color: Color(0xFF676767),
//                             ),
//                             prefixIcon: const Icon(Icons.search),
//                             fillColor: Colors.white,
//                             filled: true,
//                             contentPadding: const EdgeInsets.symmetric(vertical: 10),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(45),
//                               borderSide: BorderSide.none,
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(45),
//                               borderSide: BorderSide(color: Colors.grey.shade300),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: toggleSeeAll,
//                   child: Text(
//                     'See All',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back_ios),
//                       onPressed: scrollLeft,
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.arrow_forward_ios),
//                       onPressed: scrollRight,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 60,
//             child: ListView(
//               controller: _scrollController,
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               children: [
//                 categoryItem(
//                   "All",
//                   "assats/image/34f428e47c8da57a9f796e1596d68f1688fa073a.png",
//                   true,
//                 ),
//                 categoryItem(
//                   "Hot Dog",
//                   "assats/image/30fc202b681cf552fb8011ec1be440edbee3f301.png",
//                   false,
//                 ),
//                 categoryItem(
//                   "Burger",
//                   "assats/image/cbd8173438dd01c6f5e642f129e262e385c4d0cc.png",
//                   false,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Padding(
//             padding: EdgeInsets.only(left: 10.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Recommended for you',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('add_restaurant')
//                   .snapshots(),
//
//               builder: (context, snapshot) {
//
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 final docs = snapshot.data!.docs;
//                 final query = searchController.text.toLowerCase();
//
//                 final filteredDocs = docs.where((doc) {
//                   final data = doc.data() as Map<String, dynamic>;
//
//                   final name = (data['name'] ?? '').toString().toLowerCase();
//                   final description = (data['description'] ?? '').toString().toLowerCase();
//
//                   return name.contains(query) || description.contains(query);
//                 }).toList();
//                 return ListView.builder(
//                   itemCount: filteredDocs.length,
//
//                   itemBuilder: (context, index) {
//                     // final doc = docs[index];
//                     final doc = filteredDocs[index];
//                     final data = doc.data() as Map<String, dynamic>;
//                     final name = data['name'] ?? '';
//                     final description = data['description'] ?? '';
//                     final opening = data['opening'] ?? '';
//                     final closing = data['closing'] ?? '';
//                     final imagePath = data['image_path'] ?? '';
//
//                     final item = FavourateItem(
//                       resturantname: name,
//                       description: description,
//                       opening: opening,
//                       closing: closing,
//                       imagePath: imagePath,
//                     );
//                     return Card(
//                       margin: const EdgeInsets.all(10),
//                       color: Colors.white,
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           children: [
//
//                             Row(
//                               children: [
//
//                                 Container(
//                                   width: 90,
//                                   height: 70,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     image: DecorationImage(
//                                       image: (imagePath != '')
//                                           ? FileImage(File(imagePath))
//                                           : const AssetImage('assats/image/default.png')
//                                               as ImageProvider,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(width: 10),
//
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(name),
//                                       Text(description),
//                                     ],
//                                   ),
//                                 ),
//
//                                 IconButton(
//                                   icon: const Icon(Icons.delete, color: Colors.red),
//                                   onPressed: () {
//                                     FirebaseFirestore.instance
//                                         .collection('add_restaurant')
//                                         .doc(doc.id)
//                                         .delete();
//                                   },
//                                 ),
//
//                                 IconButton(
//                                   icon: const Icon(Icons.edit),
//                                   onPressed: () {
//                                     Get.to(() => Update1(
//                                       docId: doc.id,
//                                       data: data,
//                                     ));
//                                   },
//                                 ),
//                               ],
//                             ),
//
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Text("Open: $opening"),
//                                 const SizedBox(width: 10),
//                                 Text("Close: $closing"),
//                                 const Spacer(),
//                                 IconButton(
//                                   icon: Icon(
//                                     isFavorite(name)
//                                         ? Icons.favorite
//                                         : Icons.favorite_border,
//                                     color: const Color(0xFFEB4646),
//                                   ),
//                                   onPressed: () => toggleFavorite(item),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 15.0, top: 0),
//                                   child: SizedBox(
//                                     width: 116,
//                                     height: 35,
//                                     child: TextButton(
//                                       style: TextButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           side: const BorderSide(color: Color(0xFFEB4646)),
//                                         ),
//                                       ),
//                                       onPressed: () {
//                                         Get.to(() => const ResturantMenu(), arguments: {
//                                           'name': name,
//                                           'description': description,
//                                           'opening': opening,
//                                           'closing': closing,
//                                           'image': imagePath,
//                                         });
//                                       },
//                                       child: const Text('Moderate',
//                                           style: TextStyle(color: Color(0xFFEB4646), fontWeight: FontWeight.w700)),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0, top: 2),
//                                   child: TextButton.icon(
//                                     style: TextButton.styleFrom(
//                                       backgroundColor: const Color(0xFFEB4646),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                         side: const BorderSide(color: Color(0xFFEB4646)),
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       Get.to(() => const ResturantMenu(), arguments: {
//                                         'name': name,
//                                         'description': description,
//                                         'opening': opening,
//                                         'closing': closing,
//                                         'image': imagePath,
//                                       });
//                                     },
//                                     icon: const Icon(Icons.menu_book, color: Colors.white),
//                                     label: const Text('view menu', style: TextStyle(color: Colors.white)),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Get.to(() => Location1(), arguments: {
//                                         "docId": doc.id,
//                                         "name": name,
//                                         "description": description,
//                                         "opening": opening,
//                                         "closing": closing,
//                                         "image": imagePath,
//                                         "lat": data["lat"],
//                                                   "lng": data["lng"],
//                                       });
//                                     },
//                                     child: Image.asset('assats/image/Vector.png'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/model_users.dart';
import 'location_1.dart';
import 'resturant_menu.dart';
import 'update_1.dart';
import 'dra_home.dart';
import 'rating_1.dart';

class HomeV1 extends StatefulWidget {
  const HomeV1({super.key});

  @override
  State<HomeV1> createState() => _HomeV1State();
}

class _HomeV1State extends State<HomeV1> {


  final uid = FirebaseAuth.instance.currentUser?.uid;
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning!";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon!";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening!";
    } else {
      return "Good Night!";
    }
  }
  List<FavourateItem> favoriteList = [];
  final String favKey = "favorite_list";

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = favoriteList.map((item) {
      return "${item.resturantname}||${item.description}||${item.opening}||${item.closing}||${item.imagePath ?? ''}";
    }).toList();

    await prefs.setStringList(favKey, data);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(favKey);

    if (data != null) {
      favoriteList = data.map((e) {
        final p = e.split("||");

        return FavourateItem(
          resturantname: p[0],
          description: p[1],
          opening: p[2],
          closing: p[3],
          imagePath: p.length > 4 ? p[4] : '',
        );
      }).toList();

      setState(() {});
    }
  }

  bool isFavorite(String name) {
    return favoriteList.any((e) => e.resturantname == name);
  }


  void toggleFavorite(FavourateItem item) {
    setState(() {
      final exists = favoriteList.any(
            (e) => e.resturantname == item.resturantname,
      );

      if (exists) {
        favoriteList.removeWhere(
              (e) => e.resturantname == item.resturantname,
        );
      } else {
        favoriteList.add(item);
      }
    });

    saveFavorites();
  }

  final ScrollController _scrollController = ScrollController();
  bool showAll = false;

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 120,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void toggleSeeAll() {
    setState(() {
      showAll = !showAll;
    });
  }

  Widget categoryItem(String title, String image, bool selected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Color(0xFFEB4646) : Colors.white,
        borderRadius: BorderRadius.circular(39),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 6),
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
drawer: DraHome(),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.white,
        child: const Icon(Icons.favorite,color:Color(0xFFEB4646),),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoriteScreen(items: favoriteList),
            ),
          );
        },
      ),
      body: Column(
        children: [
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
                              children: [
                                StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('add_restaurant')
                                      .doc(uid)
                                      .snapshots(),
                                  builder: (context, snapshot) {

                                    if (!snapshot.hasData || !snapshot.data!.exists) {
                                      return const Text("No Restaurant");
                                    }

                                    final data = snapshot.data!.data() as Map<String, dynamic>;
                                    final name = data['name'] ?? '';

                                    return Text(
                                      name,
                                      style: const TextStyle(
                                        color: Color(0xFF181C2E),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22,
                                      ),
                                    );
                                  },
                                ),
                                const Icon(Icons.arrow_drop_down, color: Color(0xFF676767)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Hey Leo, ',
                                    style: TextStyle(
                                      color: Color(0xFF1E1D1D),
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: getGreeting(),
                                    style: const TextStyle(
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
                      searchController.text=value.toLowerCase();
                      searchController.selection=TextSelection.fromPosition(TextPosition(offset: searchController.text.length));
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: toggleSeeAll,
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: scrollLeft,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: scrollRight,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                categoryItem(
                  "All",
                  "assats/image/34f428e47c8da57a9f796e1596d68f1688fa073a.png",
                  true,
                ),
                categoryItem(
                  "Hot Dog",
                  "assats/image/30fc202b681cf552fb8011ec1be440edbee3f301.png",
                  false,
                ),
                categoryItem(
                  "Burger",
                  "assats/image/cbd8173438dd01c6f5e642f129e262e385c4d0cc.png",
                  false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended for you',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('add_restaurant')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;
                final query = searchController.text.toLowerCase();

                final filtered = docs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return data['name']
                      .toString()
                      .toLowerCase()
                      .contains(query) ||
                      data['description']
                          .toString()
                          .toLowerCase()
                          .contains(query);
                }).toList();

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final doc = filtered[index];
                    final data = doc.data() as Map<String, dynamic>;

                    final name = data['name'] ?? '';
                    final description = data['description'] ?? '';
                    final opening = data['opening'] ?? '';
                    final closing = data['closing'] ?? '';
                    final imagePath = data['image_path'] ?? '';

                    final item = FavourateItem(
                      resturantname: name,
                      description: description,
                      opening: opening,
                      closing: closing,
                      imagePath: imagePath,
                    );

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: (imagePath != '')
                                          ? FileImage(File(imagePath))
                                          : const AssetImage(
                                          'assats/image/default.png'),
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
                                      Text(name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(description),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('add_restaurant')
                                        .doc(doc.id)
                                        .delete();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Get.to(() => Update1(
                                      docId: doc.id,
                                      data: data,
                                    ));
                                  },
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text("Open: $opening"),
                                const SizedBox(width: 10),
                                Text("Close: $closing"),
                                const Spacer(),
                                IconButton(
                                  icon: Icon(
                                    isFavorite(name)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: const Color(0xFFEB4646),
                                  ),
                                  onPressed: () => toggleFavorite(item),
                                ),
                              ],
                            ),
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
                                          "id": docs[index].id,
                                          'description': description,
                                          'opening': opening,
                                          'closing': closing,
                                          'image': imagePath,
                                        });
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
                                        "id": docs[index].id,
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
                                      Get.to(() => Location1(), arguments: {
                                        "docId": doc.id,
                                        "name": name,
                                        "description": description,
                                        "opening": opening,
                                        "closing": closing,
                                        "image": imagePath,
                                        "lat": data["lat"],
                                        "lng": data["lng"],
                                      });
                                    },
                                    child: Image.asset('assats/image/Vector.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// ================= FAVORITE SCREEN =================

class FavoriteScreen extends StatefulWidget {
  final List<FavourateItem> items;
  final VoidCallback? onUpdate;

  const FavoriteScreen({
    super.key,
    required this.items,
    this.onUpdate,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  final String favKey = "favorite_list";

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = widget.items.map((item) {
      return "${item.resturantname}||${item.description}||${item.opening}||${item.closing}||${item.imagePath ?? ''}";
    }).toList();

    await prefs.setStringList(favKey, data);
  }

  void removeItem(FavourateItem item) {
    setState(() {
      widget.items.removeWhere((e) => e.resturantname == item.resturantname);
    });

    widget.onUpdate?.call();
    saveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              Container(
                height: 115,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFEB4646),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 50),
                    bottomRight: Radius.elliptical(200, 50),
                  ),
                ),
              ),
              Positioned(
                top: 23,
                left: 14,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              const Positioned(
                top: 30,
                left: 125,
                child: Text(
                  'Favorite',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const Positioned(
                top: 70,
                left: 126,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assats/image/78f314d8ea7273be57eb0db5224a127f63363cf1.jpg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: widget.items.isEmpty
          ? const Center(
        child: Text(
          "No Favorites",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: (item.imagePath != null && item.imagePath != '')
                              ? FileImage(File(item.imagePath!))
                              : const AssetImage('assats/image/default.png')
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
                            item.resturantname,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(item.description),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text("Open: "),
                    Text(item.opening,
                        style: const TextStyle(color: Colors.green)),
                   SizedBox(width: 15),
                   Text("Close: "),
                    Text(item.closing,
                        style: const TextStyle(color: Colors.red)),
                    Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Color(0xFFEB4646),
                      ),
                      onPressed: () => removeItem(item),
                    ),
                  ],
                ),
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
                            Get.to(ResturantMenu());
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
                          Get.to(ResturantMenu());
                        },
                        icon: const Icon(Icons.menu_book, color: Colors.white),
                        label: const Text('view menu', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(Location1());
                        },
                        child: Image.asset('assats/image/Vector.png',fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}