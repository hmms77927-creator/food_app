import 'package:flutter/material.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 800,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assats/image/dd36c1b8bd76638d992ab7e29a0cd2c6606c4115.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 46,
              left: 24,
              child: SizedBox(
                height: 62,
                width: 327,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hint: Text('Enter Your Location'),
                    hintStyle: TextStyle(color: Colors.white),
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
            Positioned(
              top: 420,
              left: 24,
              child: SizedBox(
                height: 45,
                width: 240,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFEB4646),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Color(0xFFEB4646)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
