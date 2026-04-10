// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_appnexts/home_V1.dart';
//
// class Registration extends StatefulWidget {
//   const Registration({super.key});
//
//   @override
//   State<Registration> createState() => _RegistrationState();
// }
//
// class _RegistrationState extends State<Registration> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isSave = false;
//   Future<void> login(BuildContext context) async {
//     try {
//       final userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       print("Login Success: ${userCredential.user!.email}");
//
//       // Navigate to HomeV1
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeV1()),
//       );
//     } catch (e) {
//       print("Login Error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Login Failed")),
//       );
//     }
//   }
//   Future<void> signup() async {
//     try {
//       final userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//
//       // Store user info in Firestore using UID as doc ID
//       await FirebaseFirestore.instance
//           .collection('user')
//           .doc(userCredential.user!.uid)
//           .set({
//         'name': nameController.text.trim(),
//         'email': emailController.text.trim(),
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//
//       print("User Created: ${userCredential.user!.email}");
//     } catch (e) {
//       print("Signup Error: $e");
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     'assats/image/cb23984b00eb160eb33ef90c78f455145eded34d.png',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: 555,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(36),
//                       topRight: Radius.circular(36),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           width: 48,
//                           child: Divider(
//                             color: Color(0xFFD2D4D8),
//                             thickness: 6,
//                           ),
//                         ),
//                       ),
//
//                       /// TAB BAR
//                       TabBar(
//                         labelColor: Color(0xFFEB4646),
//                         indicatorColor: Color(0xFFEB4646),
//                         dividerColor: Colors.transparent,
//                         tabs: [
//                           Tab(text: "Create Account"),
//                           Tab(text: "Login"),
//                         ],
//                       ),
//
//                       /// TAB BAR VIEW
//                       Expanded(
//                         child: TabBarView(
//                           children: [
//                             /// CREATE ACCOUNT TAB
//                             SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: .start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 15.0),
//                                     child: Text(
//                                       'Full Name',
//                                       style: TextStyle(
//                                         color: Color(0xFF9CA3AF),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ),
//                                   Center(
//                                     child: SizedBox(
//                                       height: 48,
//                                       width: 327,
//                                       child: TextField(
//                                         controller: nameController,
//                                         decoration: _inputDecoration(),
//                                       ),
//                                     ),
//                                   ),
//
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 15.0),
//                                     child: Text(
//                                       'Email address',
//                                       style: TextStyle(
//                                         color: Color(0xFF9CA3AF),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ),
//                                   Center(
//                                     child: SizedBox(
//                                       height: 48,
//                                       width: 327,
//                                       child: TextField(
//                                         controller: emailController,
//                                         decoration: _inputDecoration(),
//                                       ),
//                                     ),
//                                   ),
//
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 15.0),
//                                     child: Text(
//                                       'Password',
//                                       style: TextStyle(
//                                         color: Color(0xFF9CA3AF),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ),
//                                   Center(
//                                     child: SizedBox(
//                                       height: 48,
//                                       width: 327,
//                                       child: TextField(
//                                         controller: passwordController,
//                                         obscureText: !isSave,
//                                         decoration: _inputDecoration(
//                                           suffix: IconButton(
//                                             icon: Icon(
//                                               isSave
//                                                   ? Icons.visibility
//                                                   : Icons.visibility_off,
//                                             ),
//                                             onPressed: () {
//                                               setState(() {
//                                                 isSave = !isSave;
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                   SizedBox(height: 20),
//
//                                   Center(
//                                     child: SizedBox(
//                                       width: 256,
//                                       height: 49,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: const Color(
//                                             0xFFEB4646,
//                                           ),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                               12,
//                                             ),
//                                           ),
//                                         ),
//                                         onPressed: () async {
//                                           await signup();
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => HomeV1(),
//                                             ),
//                                           );
//                                         },
//                                         child: Text("Registration"),
//                                       ),
//                                     ),
//                                   ),
//
//                                   SizedBox(height: 15),
//
//                                   Center(
//                                     child: SizedBox(
//                                       width: 256,
//                                       height: 49,
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => HomeV1(),
//                                             ),
//                                           );
//                                         },
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                               12,
//                                             ),
//                                             border: Border.all(
//                                               color: Color(0xFFD2D4D8),
//                                               width: 1.5,
//                                             ),
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                             children: [
//                                               Image.asset(
//                                                 'assats/image/ic_google.png',
//                                                 width: 20,
//                                               ),
//                                               SizedBox(width: 8),
//                                               Text('Sign up with Google'),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             /// LOGIN TAB (empty for now)
//                             Center(
//                               child: Container(
//                                 child: Column(
//                                   crossAxisAlignment: .start,
//                                   children: [
//                                     Text(
//                                       'Email address',
//                                       style: TextStyle(
//                                         color: Color(0xFF9CA3AF),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 48,
//                                       width: 327,
//                                       child: TextField(
//                                         controller: emailController,
//                                         decoration: _inputDecoration(),
//                                       ),
//                                     ),
//
//                                     Text(
//                                       'Password',
//                                       style: TextStyle(
//                                         color: Color(0xFF9CA3AF),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 48,
//                                       width: 327,
//                                       child: TextField(
//                                         controller: passwordController,
//                                         obscureText: !isSave,
//                                         decoration: _inputDecoration(
//                                           suffix: IconButton(
//                                             icon: Icon(
//                                               isSave
//                                                   ? Icons.visibility
//                                                   : Icons.visibility_off,
//                                             ),
//                                             onPressed: () {
//                                               setState(() {
//                                                 isSave = !isSave;
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//
//                                     SizedBox(height: 20),
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                         top: 35.0,
//                                         left: 30,
//                                       ),
//                                       child: SizedBox(
//                                         width: 256,
//                                         height: 49,
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: const Color(
//                                               0xFFEB4646,
//                                             ),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(12),
//                                             ),
//                                           ),
//                                           onPressed: () async {
//                                             await login(context);
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) => HomeV1(),
//                                               ),
//                                             );
//                                           },
//                                           child: Text(
//                                             "Registration",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: .w700,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//
//                                     SizedBox(height: 15),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                         top: 10.0,
//                                         left: 35,
//                                       ),
//                                       child: SizedBox(
//                                         width: 256,
//                                         height: 49,
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) => HomeV1(),
//                                               ),
//                                             );
//                                           },
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(12),
//                                               border: Border.all(
//                                                 color: Color(0xFFD2D4D8),
//                                                 width: 1.5,
//                                               ),
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                               children: [
//                                                 Image.asset(
//                                                   'assats/image/ic_google.png',
//                                                   width: 20,
//                                                 ),
//                                                 SizedBox(width: 8),
//                                                 Text('Sign up with Google'),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   InputDecoration _inputDecoration({Widget? suffix}) {
//     return InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: Color(0xFFBEC5D1)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: Color(0xFFBEC5D1)),
//       ),
//       suffixIcon: suffix,
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/home_V1.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Registration(),
  ));
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSave = false;
  bool isLoading = false;

  /// SIGNUP FUNCTION
  Future<void> signup() async {
    setState(() => isLoading = true);
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Firestore: UID as doc ID
      await FirebaseFirestore.instance
          .collection('users') // Recommended collection name
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Successful!")),
      );

      // Navigate to HomeV1
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeV1()),
      );
    } on FirebaseAuthException catch (e) {
      String msg = "";
      if (e.code == 'weak-password') {
        msg = 'Password is too weak';
      } else if (e.code == 'email-already-in-use') {
        msg = 'Email already exists';
      } else {
        msg = e.message ?? "Signup Failed";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
    setState(() => isLoading = false);
  }

  /// LOGIN FUNCTION
  Future<void> login() async {
    setState(() => isLoading = true);
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeV1()),
      );
    } on FirebaseAuthException catch (e) {
      String msg = "";
      if (e.code == 'user-not-found') {
        msg = 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password';
      } else {
        msg = e.message ?? "Login Failed";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
    setState(() => isLoading = false);
  }

  /// INPUT DECORATION
  InputDecoration _inputDecoration({Widget? suffix}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFBEC5D1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFBEC5D1)),
      ),
      suffixIcon: suffix,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assats/image/cb23984b00eb160eb33ef90c78f455145eded34d.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 555,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    SizedBox(
                      width: 48,
                      child: Divider(
                        color: Color(0xFFD2D4D8),
                        thickness: 6,
                      ),
                    ),
                    TabBar(
                      labelColor: Color(0xFFEB4646),
                      indicatorColor: Color(0xFFEB4646),
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: "Create Account"),
                        Tab(text: "Login"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          /// SIGNUP TAB
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  _buildTextField("Full Name", nameController),
                                  SizedBox(height: 12),
                                  _buildTextField("Email address", emailController),
                                  SizedBox(height: 12),
                                  _buildPasswordField("Password", passwordController),
                                  SizedBox(height: 20),
                                  isLoading
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFEB4646),
                                      minimumSize: Size(256, 49),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: signup,
                                    child: Text("Register"),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// LOGIN TAB
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  _buildTextField("Email address", emailController),
                                  SizedBox(height: 12),
                                  _buildPasswordField("Password", passwordController),
                                  SizedBox(height: 20),
                                  isLoading
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFEB4646),
                                      minimumSize: Size(256, 49),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: login,
                                    child: Text("Login"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
        SizedBox(height: 4),
        TextField(controller: controller, decoration: _inputDecoration()),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: !isSave,
          decoration: _inputDecoration(
            suffix: IconButton(
              icon:
              Icon(isSave ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => isSave = !isSave),
            ),
          ),
        ),
      ],
    );
  }
}
