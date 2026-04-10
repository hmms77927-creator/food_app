// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_appnexts/notes.dart';
// import 'package:flutter_application_appnexts/rating_1.dart';
// import 'package:flutter_application_appnexts/registration.dart';
// import 'package:flutter_application_appnexts/setting.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
// class DraHome extends StatefulWidget {
//   const DraHome({super.key});
//
//   @override
//   State<DraHome> createState() => _DraHomeState();
// }
//
// class _DraHomeState extends State<DraHome> {
//   final user = FirebaseAuth.instance.currentUser;
//   final uid = FirebaseAuth.instance.currentUser?.uid ?? "";
//   Future<void> logout() async {
//     await FirebaseAuth.instance.signOut();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               PreferredSize(
//                 preferredSize: Size.fromHeight(190),
//                 child: SizedBox(
//                   height: 190,
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: 115,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Color(0xFFEB4646),
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.elliptical(100, 30),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 80,
//                         left: 85,
//                         child: Container(
//                           child: CircleAvatar(
//                             radius: 50,
//                             backgroundImage: AssetImage(
//                               'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // StreamBuilder<QuerySnapshot>(
//               //   stream: FirebaseFirestore.instance
//               //       .collection('user')
//               //       .snapshots(),
//               //   builder:
//               //       (
//               //         BuildContext context,
//               //         AsyncSnapshot<QuerySnapshot> snapshot,
//               //       ) {
//               //         if (!snapshot.hasData) {
//               //           return Center(child: CircularProgressIndicator());
//               //         }
//               //         final data = snapshot.data!;
//               //         final name = data['name'];
//               //         final email = data['email'];
//               //         return Column(
//               //           children: [
//               //             Text(
//               //               '$name',
//               //               style: TextStyle(
//               //                 color: Colors.black,
//               //                 fontSize: 18,
//               //                 fontWeight: .w600,
//               //               ),
//               //             ),
//               //             Text(
//               //               '$email',
//               //               style: TextStyle(
//               //                 color: Color(0xFF6B7280),
//               //                 fontSize: 18,
//               //                 fontWeight: .w600,
//               //               ),
//               //             ),
//               //           ],
//               //         );
//               //       },
//               // ),
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('users')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Center(child: Text("No Data"));
//                   }
//
//                   final doc = snapshot.data!.docs[0]; // first document
//                   final name = doc['name'] ?? "";
//                   final email = doc['email'] ?? "";
//
//                   return Column(
//                     children: [
//                       Text(name,  style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: .w600,
//                       ),),
//                       Text(email,style: TextStyle(
//                         color: Color(0xFF6B7280),
//                         fontSize: 18,
//                         fontWeight: .w600,
//                       ),),
//                     ],
//                   );
//                 },
//               ),
//               // Container(
//               //   child: Text(
//               //     'Justice Life',
//               //     style: TextStyle(
//               //       color: Colors.black,
//               //       fontSize: 18,
//               //       fontWeight: .w600,
//               //     ),
//               //   ),
//               // ),
//               // Container(
//               //   child: Text(
//               //     'justice@justice.life',
//               //     style: TextStyle(
//               //       color: Color(0xFF6B7280),
//               //       fontSize: 18,
//               //       fontWeight: .w600,
//               //     ),
//               //   ),
//               // ),
//               GestureDetector(
//                 onTap: () {
//                   MaterialPageRoute(builder: (context) => Setting());
//                 },
//                 child: Center(
//                   child: SizedBox(
//                     height: 57,
//                     width: 217,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Setting()),
//                         );
//                       },
//                       child: Card(
//                         elevation: 4,
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: Container(
//                                 child: CircleAvatar(
//                                   radius: 20,
//                                   backgroundImage: AssetImage(
//                                     'assats/image/Frame.png',
//                                   ),
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               child: Text(
//                                 'Account setting',
//                                 style: TextStyle(
//                                   color: Color(0xFF344151),
//                                   fontSize: 18,
//                                   fontWeight: .w400,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15.0),
//                 child: SizedBox(
//                   width: 217,
//                   child: Card(
//                     elevation: 4,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20.0),
//                                   child: Container(
//                                     width: 18,
//                                     height: 17,
//                                     child: Image.asset(
//                                       'assats/image/Frame 12.png',
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: Container(
//                                     child: Text(
//                                       'Language',
//                                       style: TextStyle(
//                                         color: Color(0xFF344151),
//                                         fontSize: 18,
//                                         fontWeight: .w400,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Notes(),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20.0),
//                                   child: Container(
//                                     width: 22,
//                                     height: 22,
//                                     child: Image.asset(
//                                       'assats/image/Frame (3).png',
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: Container(
//                                     child: Text(
//                                       'Feedback',
//                                       style: TextStyle(
//                                         color: Color(0xFF344151),
//                                         fontSize: 18,
//                                         fontWeight: .w400,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Rating1(),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20.0),
//                                   child: Container(
//                                     width: 20,
//                                     height: 21,
//                                     child: Image.asset(
//                                       'assats/image/Frame 11.png',
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: Container(
//                                     child: Text(
//                                       'Rate us',
//                                       style: TextStyle(
//                                         color: Color(0xFF344151),
//                                         fontSize: 18,
//                                         fontWeight: .w400,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20.0),
//                                   child: Container(
//                                     height: 15,
//                                     width: 15,
//                                     child: Image.asset(
//                                       'assats/image/Frame (4).png',
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: Container(
//                                     child: Text(
//                                       'New Version',
//                                       style: TextStyle(
//                                         color: Color(0xFF344151),
//                                         fontSize: 18,
//                                         fontWeight: .w400,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 120.0, left: 120),
//                child:GestureDetector(
//                  onTap: () {
//                    Get.defaultDialog(
//                      title: "Logout",
//                      middleText: "Are you sure you want to logout?",
//                      textCancel: "No",
//                      textConfirm: "Yes",
//                      confirmTextColor: Colors.white,
//                      barrierDismissible: false,
//                      onConfirm: () async {
//                        try {
//                          // ✅ Sign out user
//                          await FirebaseAuth.instance.signOut();
//
//                          // ✅ Navigate to Registration and remove all previous routes
//                          Get.offAll(() => Registration());
//                        } catch (e) {
//                          // Optional: show error if sign-out fails
//                          Get.snackbar("Error", e.toString());
//                        }
//                      },
//                      onCancel: () {
//                        Get.back(); // Close dialog
//                      },
//                    );
//                  },
//                  child: Container(
//                    width: 27,
//                    height: 25,
//                    child: Image.asset('assats/image/Vector (1).png'),
//                  ),
//                ),
//                // child:    GestureDetector(
//                //      onTap: ()  {
//                //        Get.defaultDialog(
//                //          title: "Logout",
//                //          middleText: "Are you sure you want to logout?",
//                //          textCancel: "No",
//                //          textConfirm: "Yes",
//                //          confirmTextColor: Colors.white,
//                //        //   onConfirm: () async {
//                //        //     await logout();
//                //        //     // Navigator.pushAndRemoveUntil(
//                //        //     //   context,
//                //        //     //   MaterialPageRoute(builder: (context) => Registration()),);
//                //        //           // (route) => false,
//                //        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()) );
//                //        //   },
//                //        //   onCancel: () {
//                //        //     Get.back(); // Close dialog
//                //        //   },
//                //        //   barrierDismissible: false,
//                //        // );
//                //            onConfirm: () async {
//                //              await FirebaseAuth.instance.signOut();
//                //              Navigator.pushAndRemoveUntil(
//                //                context,
//                //                MaterialPageRoute(builder: (_) => Registration()),
//                //                    (route) => false, // remove all previous routes
//                //              );
//                //      }
//                //      },
//                //      child: Container(
//                //        width: 27,
//                //        height: 25,
//                //        child: Image.asset('assats/image/Vector (1).png'),
//                //      ),
//                //    ),
//
//
//                 // child: GestureDetector(
//                 //   onTap: ()async {
//                 //    Get.defaultDialog(
//                 //      textCustom: 'Want to Logout',
//                 //      textConfirm: 'Yes',
//                 //     textCancel: 'No',
//                 //      content: Column(
//                 //        children: [
//                 //          Text('Want to Logout',),
//                 //          Row(
//                 //            children: [
//                 //              TextButton.icon(onPressed: ()async{
//                 //              await FirebaseAuth.instance.signOut();
//                 //                Navigator.push(
//                 //                  context,
//                 //                  MaterialPageRoute(builder: (context) => Registration()),
//                 //                );
//                 //              }, label:Text('Yes',style: TextStyle(color:Colors.black),)),
//                 //              TextButton.icon(onPressed: (){}, label:Text('No',style: TextStyle(color:Colors.black),))
//                 //
//                 //            ],
//                 //          )
//                 //        ],
//                 //      )
//                 //    );
//                 //     // Navigator.push(
//                 //     //   context,
//                 //     //   MaterialPageRoute(builder: (context) => Registration()),
//                 //     // );
//                 //   },
//                 //   child: Container(
//                 //     width: 27,
//                 //     height: 25,
//                 //     child: Image.asset('assats/image/Vector (1).png'),
//                 //   ),
//                 // ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/notes.dart';
import 'package:flutter_application_appnexts/rating_1.dart';
import 'package:flutter_application_appnexts/registration.dart';
import 'package:flutter_application_appnexts/setting.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DraHome extends StatefulWidget {
  const DraHome({super.key});

  @override
  State<DraHome> createState() => _DraHomeState();
}

class _DraHomeState extends State<DraHome> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fix 1: Proper logout method with error handling
  Future<void> logout() async {
    try {
      await _auth.signOut();

      // Clear any cached data if needed
      // await Get.deleteAll(); // Optional: clear GetX controllers

      // Navigate to registration screen and remove all previous routes
      Get.offAll(() => const Registration());

      // Show success message
      Get.snackbar(
        'Logout Successful',
        'You have been logged out',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      print('Logout error: $e'); // Add logging for debugging
      Get.snackbar(
        'Logout Failed',
        'Error: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final String? uid = user?.uid;

    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Drawer Header
              SizedBox(
                height: 190,
                child: Stack(
                  children: [
                    Container(
                      height: 115,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEB4646),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(100, 30),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 85,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Fix 2: Check if user is logged in before showing data
              uid != null
                  ? StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Text("No Data Found");
                  }

                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  final name = data['name'] ?? 'User';
                  final email = data['email'] ?? 'No email';

                  return Column(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              )
                  : const Text("Please login again"), // Show this if user is null

              const SizedBox(height: 20),

              // Account Settings Button
              SizedBox(
                height: 57,
                width: 217,
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assats/image/Frame.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    title: const Text(
                      'Account Setting',
                      style: TextStyle(
                        color: Color(0xFF344151),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Setting()),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Other Options Card
              SizedBox(
                width: 217,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'assats/image/Frame 12.png',
                          width: 18,
                          height: 17,
                        ),
                        title: const Text(
                          'Language',
                          style: TextStyle(
                            color: Color(0xFF344151),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          // Handle Language
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assats/image/Frame (3).png',
                          width: 22,
                          height: 22,
                        ),
                        title: const Text(
                          'Feedback',
                          style: TextStyle(
                            color: Color(0xFF344151),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Notes()));
                          // Get.to(() => const Notes());
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assats/image/Frame 11.png',
                          width: 20,
                          height: 21,
                        ),
                        title: const Text(
                          'Rate Us',
                          style: TextStyle(
                            color: Color(0xFF344151),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> Rating1()));
                          },
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assats/image/Frame (4).png',
                          width: 15,
                          height: 15,
                        ),
                        title: const Text(
                          'New Version',
                          style: TextStyle(
                            color: Color(0xFF344151),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          // Handle new version
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 120),

              // Fix 3: Improved Logout Button with better dialog handling
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    textCancel: "No",
                    textConfirm: "Yes",
                    confirmTextColor: Colors.white,
                    onConfirm: () async {
                      // Close dialog first
                      Get.back();
                      // Then perform logout
                      await logout();
                    },
                    onCancel: () {
                      Get.back(); // Close dialog without logging out
                    },
                    barrierDismissible: false,
                  );
                },
                child: Container(
                  width: 27,
                  height: 25,
                  child: Image.asset('assats/image/Vector (1).png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_appnexts/notes.dart';
// import 'package:flutter_application_appnexts/rating_1.dart';
// import 'package:flutter_application_appnexts/registration.dart';
// import 'package:flutter_application_appnexts/setting.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class DraHome extends StatefulWidget {
//   const DraHome({super.key});
//
//   @override
//   State<DraHome> createState() => _DraHomeState();
// }
//
// class _DraHomeState extends State<DraHome> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String imagePath = '';
//
//   // ✅ PICK IMAGE + SAVE TO FIRESTORE
//   Future pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image =
//     await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       imagePath = image.path;
//
//       final user = _auth.currentUser;
//       if (user != null) {
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .update({
//           'image': imagePath, // ✅ SAVE
//         });
//       }
//
//       setState(() {});
//     }
//   }
//
//   // ✅ LOGOUT
//   Future<void> logout() async {
//     await _auth.signOut();
//     Get.offAll(() => const Registration());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = _auth.currentUser;
//     final uid = user?.uid;
//
//     return SafeArea(
//       child: Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//
//               // 🔴 HEADER
//               SizedBox(
//                 height: 190,
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 115,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Color(0xFFEB4646),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.elliptical(100, 30),
//                         ),
//                       ),
//                     ),
//
//                     // ✅ IMAGE FROM FIRESTORE
//                     Positioned(
//                       top: 80,
//                       left: 85,
//                       child: uid != null
//                           ? StreamBuilder<DocumentSnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection('users')
//                             .doc(uid)
//                             .snapshots(),
//                         builder: (context, snapshot) {
//                           String? img;
//
//                           if (snapshot.hasData &&
//                               snapshot.data!.exists) {
//                             final data = snapshot.data!.data()
//                             as Map<String, dynamic>;
//                             img = data['image'];
//                           }
//
//                           return GestureDetector(
//                             onTap: pickImage, // ✅ CLICK TO CHANGE
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundImage: img != null &&
//                                   img.isNotEmpty
//                                   ? FileImage(File(img))
//                                   : const AssetImage(
//                                 'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
//                               ) as ImageProvider,
//                             ),
//                           );
//                         },
//                       )
//                           : const CircleAvatar(radius: 50),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               // ✅ USER DATA
//               uid != null
//                   ? StreamBuilder<DocumentSnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(uid)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const CircularProgressIndicator();
//                   }
//
//                   final data =
//                   snapshot.data!.data() as Map<String, dynamic>;
//
//                   return Column(
//                     children: [
//                       Text(data['name'] ?? ''),
//                       Text(data['email'] ?? ''),
//                     ],
//                   );
//                 },
//               )
//                   : const Text("Login again"),
//
//               const SizedBox(height: 20),
//
//               // 🔹 BUTTONS SAME UI
//               ListTile(
//                 title: const Text('Account Setting'),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const Setting()));
//                 },
//               ),
//
//               ListTile(
//                 title: const Text('Feedback'),
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => Notes()));
//                 },
//               ),
//
//               ListTile(
//                 title: const Text('Rate Us'),
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => Rating1()));
//                 },
//               ),
//
//               const SizedBox(height: 100),
//
//               // 🔴 LOGOUT
//               GestureDetector(
//                 onTap: () {
//                   Get.defaultDialog(
//                     title: "Logout",
//                     middleText: "Are you sure?",
//                     onConfirm: () async {
//                       Get.back();
//                       await logout();
//                     },
//                     onCancel: () => Get.back(),
//                   );
//                 },
//                 child: Image.asset(
//                   'assats/image/Vector (1).png',
//                   width: 30,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
