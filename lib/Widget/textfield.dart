import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 48,
        width: 323,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFBEC5D1),
            ),),
            hint: Text(text),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
             borderSide: BorderSide(color: Color(0xFFBEC5D1),
            ),
          ),
        ),
        ),
      ),
    );
  }
}
