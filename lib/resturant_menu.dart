import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/location_1.dart';
import 'package:flutter_application_appnexts/rating_1.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResturantMenu extends StatefulWidget {
  const ResturantMenu({super.key});

  @override
  State<ResturantMenu> createState() => _ResturantMenuState();
}

class _ResturantMenuState extends State<ResturantMenu> {
  final data = Get.arguments;

  final String name = data['name'];
  final String description = data['description'];
  final String opening = data['opening'];
  final String closing = data['closing'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Resturant Menu ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: .w700,
          ),
        ),
        centerTitle: true,
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_book, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    child: Image.asset(
                      'assats/image/ecaa5c0d4bd618634326e8c00080ab106a4c9206 (2).png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 234,
                    left: 116,
                    right: 116,
                    child: Container(
                      width: 137,
                      height: 132,
                      child: Image.asset(
                        'assats/image/70E73AC6-BF5C-4785-92A2-1F14DF657095 2.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card(
            Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  // child: Container(
                  //   child: Text(
                  //     'Le Courno’s Restorentie',
                  //     style: TextStyle(
                  //       color: Color(0xFF181C2E),
                  //       fontSize: 24,
                  //       fontWeight: .w700,
                  //     ),
                  //   ),
                  // ),
                  child: Container(
                    child: Text(
                      '$name',
                      style: TextStyle(
                        color: Color(0xFF181C2E),
                        fontSize: 24,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30.0),
                //   child: Container(
                //     child: Text(
                //       'Burger - Chicken - Riche - Wings ',
                //       style: TextStyle(
                //         color: Color(0xFF181C2E),
                //         fontSize: 20,
                //         fontWeight: .w400,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    child: Text(
                      '$description ',
                      style: TextStyle(
                        color: Color(0xFF181C2E),
                        fontSize: 20,
                        fontWeight: .w400,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.star_border, color: Color(0xFFEB4646)),
                      ),
                    ),
                    Text(
                      '4.7',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: .w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        child: Text(
                          '5000+ ratings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: .w400,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Rating1()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          child: Text(
                            'See Reviews',
                            style: TextStyle(
                              color: Color(0xFFEB4646),
                              fontSize: 16,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Container(
                  //   child: Text(
                  //     'Open : ',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: .w700,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Text(
                      'Open :$opening ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Container(
                  //   child: Text(
                  //     '12:00 PM   ',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: .w700,
                  //       color: Colors.green,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Text(
                      '5000+ ratings',
                      style: TextStyle(
                        color: Color(0xFF808080),
                        fontSize: 17,
                        fontWeight: .w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Container(
            //     child: Text(
            //       'Description',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 22,
            //         fontWeight: .w700,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Container(
                child: Text(
                  '$description',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: .w700,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Container(
            //     child: Text(
            //       'it is the restaurant which has  amazing',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 16,
            //         fontWeight: .w400,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Container(
            //     child: Text(
            //       'menu Burger - steak , pizza , wrap, ',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 16,
            //         fontWeight: .w400,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Container(
            //     child: Text(
            //       'drinks , hot bar , salad bar and many  ',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 16,
            //         fontWeight: .w400,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Container(
            //     child: Text(
            //       'taste',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 16,
            //         fontWeight: .w400,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  SizedBox(
                    width: 250,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFEB4646),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          side: BorderSide(color: Color(0xFFEB4646)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Moderate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Location1()),
                      );
                    },
                    child: Container(
                      child: Image.asset('assats/image/Vector.png'),
                    ),
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
