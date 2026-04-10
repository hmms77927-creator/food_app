import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/food_menu.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Location1 extends StatefulWidget {
  const Location1({super.key});

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  late final Map data;
  @override
  void initState() {
    data =Get.arguments ?? {};

  }
  @override
  Widget build(BuildContext context) {
    final imagePath = data['image'] ?? ''; // get image path

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: SizedBox(
            width: 301,
            height: 49,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter Your Location',
                hintStyle: TextStyle(color: Colors.black),
                prefix: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
                    ),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFFEB4646),
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: CircleBorder(),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 551,
              child: Image.asset(
                'assats/image/dd36c1b8bd76638d992ab7e29a0cd2c6606c4115.png',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  // child: Container(
                  //   width: 135,
                  //   height: 110,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.transparent, // border color
                  //       width: 1,
                  //     ),
                  //     borderRadius: BorderRadius.circular(12),
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         'assats/image/ecaa5c0d4bd618634326e8c00080ab106a4c9206.png',
                  //       ),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  child: Container(
                    width: 135,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imagePath != ''
                            ? FileImage(File(imagePath)) as ImageProvider
                            : AssetImage('assats/image/default.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        child: Text(
                          data['name']?? '',
                          style: TextStyle(
                            color: Color(0xFF181C2E),
                            fontSize: 18,
                            fontWeight: .w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                       data['description']??'',
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontSize: 14,
                          fontWeight: .w400,
                        ),
                      ),
                    ),
                    // Container(
                    //   child: Text(
                    //     '- Wings  ',
                    //     style: TextStyle(
                    //       color: Color(0xFFA0A5BA),
                    //       fontSize: 14,
                    //       fontWeight: .w400,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star_border,
                              color: Color(0xFFEB4646),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '4.7',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            'Open : ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                          data['opening']??'',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .w700,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFEB4646),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        side: BorderSide(color: Color(0xFFEB4646)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodMenu()),
                      );
                    },
                    label: Text(
                      'view menu',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(Icons.menu_book, color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Distance: 1500 km',
                    style: TextStyle(fontSize: 17, fontWeight: .w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}