import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/first_1.dart';
import 'package:flutter_application_appnexts/imge.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => First1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assats/image/484463b08c814fbe1ce7157478a44d11b763044b.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Positioned(
              left: 66,
              top: 177,
              child: Container(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assats/image/70E73AC6-BF5C-4785-92A2-1F14DF657095 1.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
