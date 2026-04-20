import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/registration_1.dart';

class First1 extends StatefulWidget {
  const First1({super.key});

  @override
  State<First1> createState() => First1State();
}

class First1State extends State<First1> {
  PageController _pageController = PageController();
  int currentpage = 0;
  final int totalPages = 3;
  final double size = 80;
  final double progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentpage = index;
              });
            },
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 500,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 139,
                              left: 61,
                              child: Container(
                                height: 244,
                                width: 244,
                                child: Image.asset(
                                  'assats/image/Ellipse 1302.png',
                                ),
                              ),
                            ),
                            Positioned(
                              top: 286,
                              child: Container(
                                height: 157,
                                child: Image.asset(
                                  'assats/image/Ellipse 1303 (4).png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Nearby restaurants',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'You do not have to go far to find a good restaurant',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF485563),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'we have provided all the restaurants that is near you',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF485563),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 500,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 145,
                              left: 27,
                              child: Container(
                                width: 315,
                                height: 255,
                                child: Image.asset(
                                  'assats/image/Rectangle 4179.png',
                                ),
                              ),
                            ),
                            Positioned(
                              top: 150,
                              left: 25,
                              child: Container(
                                width: 296,
                                height: 221,
                                child: Image.asset(
                                  'assats/image/Rectangle 4178.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Select the Favorites Menu',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'You do not have to go far to find a good restaurant',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF485563),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'we have provided all the restaurants that is near you',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF485563),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 500,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 141,
                              left: 20,
                              child: Container(
                                width: 318,
                                height: 247,
                                child: Image.asset(
                                  'assats/image/Rectangle 4179 (1).png',
                                ),
                              ),
                            ),
                            Positioned(
                              left: 23,
                              top: 154,
                              child: Container(
                                width: 332,
                                height: 252,
                                child: Image.asset(
                                  'assats/image/Rectangle 4180.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Good food at a cheap price',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'You can eat at expensive restaurants with affordable price',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF485563),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registration1()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: const Color(0xFFEB4646),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(totalPages, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentpage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentpage == index
                            ? const Color(0xFFEB4646)
                            : const Color(0xFF485563),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentpage < totalPages - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      print("Get Started tapped");
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: size,
                        height: size,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (currentpage < totalPages - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registration1(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.red,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
