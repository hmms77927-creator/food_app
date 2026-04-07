import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/notes.dart';
import 'package:flutter_application_appnexts/rating_1.dart';
import 'package:flutter_application_appnexts/registration.dart';
import 'package:flutter_application_appnexts/setting.dart';

class DraHome extends StatefulWidget {
  const DraHome({super.key});

  @override
  State<DraHome> createState() => _DraHomeState();
}

class _DraHomeState extends State<DraHome> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(190),
                child: SizedBox(
                  height: 190,
                  child: Stack(
                    children: [
                      Container(
                        height: 115,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFEB4646),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(100, 30),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 85,
                        child: Container(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // StreamBuilder<QuerySnapshot>(
              //   stream: FirebaseFirestore.instance
              //       .collection('user')
              //       .snapshots(),
              //   builder:
              //       (
              //         BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot,
              //       ) {
              //         if (!snapshot.hasData) {
              //           return Center(child: CircularProgressIndicator());
              //         }
              //         final data = snapshot.data!;
              //         final name = data['name'];
              //         final email = data['email'];
              //         return Column(
              //           children: [
              //             Text(
              //               '$name',
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 18,
              //                 fontWeight: .w600,
              //               ),
              //             ),
              //             Text(
              //               '$email',
              //               style: TextStyle(
              //                 color: Color(0xFF6B7280),
              //                 fontSize: 18,
              //                 fontWeight: .w600,
              //               ),
              //             ),
              //           ],
              //         );
              //       },
              // ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("No Data"));
                  }

                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final name = docs[index]['name'];
                      final email = docs[index]['email'];

                      return ListTile(title: Text(name), subtitle: Text(email));
                    },
                  );
                },
              ),

              // Container(
              //   child: Text(
              //     'Justice Life',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 18,
              //       fontWeight: .w600,
              //     ),
              //   ),
              // ),
              // Container(
              //   child: Text(
              //     'justice@justice.life',
              //     style: TextStyle(
              //       color: Color(0xFF6B7280),
              //       fontSize: 18,
              //       fontWeight: .w600,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  MaterialPageRoute(builder: (context) => Setting());
                },
                child: Center(
                  child: SizedBox(
                    height: 57,
                    width: 217,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setting()),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assats/image/Frame.png',
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                child: Text(
                                  'Account setting',
                                  style: TextStyle(
                                    color: Color(0xFF344151),
                                    fontSize: 18,
                                    fontWeight: .w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: 217,
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 18,
                                    height: 17,
                                    child: Image.asset(
                                      'assats/image/Frame 12.png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    child: Text(
                                      'Language',
                                      style: TextStyle(
                                        color: Color(0xFF344151),
                                        fontSize: 18,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Notes(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    child: Image.asset(
                                      'assats/image/Frame (3).png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    child: Text(
                                      'Feedback',
                                      style: TextStyle(
                                        color: Color(0xFF344151),
                                        fontSize: 18,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Rating1(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 20,
                                    height: 21,
                                    child: Image.asset(
                                      'assats/image/Frame 11.png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    child: Text(
                                      'Rate us',
                                      style: TextStyle(
                                        color: Color(0xFF344151),
                                        fontSize: 18,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(
                                      'assats/image/Frame (4).png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    child: Text(
                                      'New Version',
                                      style: TextStyle(
                                        color: Color(0xFF344151),
                                        fontSize: 18,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registration()),
                    );
                  },
                  child: Container(
                    width: 27,
                    height: 25,
                    child: Image.asset('assats/image/Vector (1).png'),
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
