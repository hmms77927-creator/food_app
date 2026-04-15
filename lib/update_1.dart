import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Update1 extends StatefulWidget {
  final String docId;
  final Map<String, dynamic> data;

  const Update1({
    super.key,
    required this.docId,
    required this.data,
  });

  @override
  State<Update1> createState() => _Update1State();
}

class _Update1State extends State<Update1> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController openController = TextEditingController();
  TextEditingController closeController = TextEditingController();

  String imagePath = '';

  @override
  void initState() {
    super.initState();

    nameController.text = widget.data['name'] ?? '';
    descController.text = widget.data['description'] ?? '';
    openController.text = widget.data['opening'] ?? '';
    closeController.text = widget.data['closing'] ?? '';

    imagePath = widget.data['image_path'] ?? '';
  }
  Future pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Restaurant"),
        backgroundColor: const Color(0xFFEB4646),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: imagePath == ''
                    ? const Center(child: Text("Tap to select image"))
                    : Image.file(File(imagePath), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Restaurant Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: openController,
              decoration: InputDecoration(
                labelText: "Opening Time",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: closeController,
              decoration: InputDecoration(
                labelText: "Closing Time",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('add_restaurant')
                      .doc(widget.docId)
                      .update({
                    'name': nameController.text,
                    'description': descController.text,
                    'opening': openController.text,
                    'closing': closeController.text,
                    'image_path': imagePath,
                  });
                  Get.back();
                  Get.snackbar(
                    "Success",
                    "Restaurant Updated",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEB4646),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
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