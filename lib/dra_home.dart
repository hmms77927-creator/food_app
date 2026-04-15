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
                  : const Text("Please login again"),
              const SizedBox(height: 20),
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
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.only(right: 30,bottom: 40),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Logout",
                        middleText: "Are you sure you want to logout?",
                        textCancel: "No",
                        textConfirm: "Yes",
                        confirmTextColor: Colors.white,
                        onConfirm: () async {
                          Get.back();
                          await logout();
                        },
                        onCancel: () {
                          Get.back();
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

