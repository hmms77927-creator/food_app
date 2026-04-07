import 'package:flutter/material.dart';

class uploadtextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const uploadtextfield({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide(color: Color(0xFFBEC5D1)),
      ),
      hint:Text(text),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide(color: Color(0xFFBEC5D1)),
      ),
    ),
    );
  }
}
