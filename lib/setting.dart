import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registration.dart';
import 'imge.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.trim(),
      );

      Get.snackbar(
        "Success",
        "Reset email sent successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? e.code,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();

      Get.offAll(() => const Registration());

      Get.snackbar(
        'Logout Successful',
        'You have been logged out',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Logout Failed',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  void showResetDialog() {
    TextEditingController emailController = TextEditingController();

    Get.defaultDialog(
      title: "Change password",
      content: Column(
        children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Enter your email",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      textConfirm: "Send",
      textCancel: "Cancel",
      onConfirm: () async {
        String email = emailController.text.trim();

        if (email.isEmpty) {
          Get.snackbar(
            "Error",
            "Email cannot be empty",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }

        Get.back();
        await resetPassword(email);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              const Positioned(
                top: 30,
                left: 125,
                child: Text(
                  'Account Setting',
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
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              showResetDialog();
            },
            child: Center(
              child: SizedBox(
                height: 65,
                width: 346,
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.lock),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Change password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Imge()),
              );
            },
            child: Center(
              child: SizedBox(
                height: 65,
                width: 346,
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.person),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Edit profile',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: "Logout",
                middleText: "Are you sure you want to logout?",
                textConfirm: "Yes",
                textCancel: "No",
                onConfirm: () {
                  Get.back();
                  logout();
                },
              );
            },
            child: Center(
              child: SizedBox(
                height: 65,
                width: 346,
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 70.0),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.logout),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
