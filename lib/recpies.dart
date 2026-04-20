import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'food_menu.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  TextEditingController recipeController = TextEditingController();

  String imagePath = '';
  final uid = FirebaseAuth.instance.currentUser!.uid;

  bool isEdit = false;
  String? editDocId;

  @override
  void initState() {
    super.initState();
  }

  Future pickImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);

    if (img != null) {
      setState(() {
        imagePath = img.path;
      });
    }
  }

  void setEditData(String docId, String recipe, String image) {
    setState(() {
      isEdit = true;
      editDocId = docId;
      recipeController.text = recipe;
      imagePath = image;
    });
  }


  Future saveData() async {
    if (recipeController.text.isEmpty) return;

    if (isEdit) {
      await FirebaseFirestore.instance
          .collection('recipes')
          .doc(editDocId)
          .update({
        "recipe": recipeController.text,
        "image": imagePath,
        "updatedAt": FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Recipe Updated");
    } else {
      /// ➕ ADD NEW
      await FirebaseFirestore.instance.collection('recipes').add({
        "recipe": recipeController.text,
        "image": imagePath,
        "uid": uid,
        "createdAt": FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Recipe Added");
    }

    clearFields();
    Get.to(const FoodMenu());
  }

  void clearFields() {
    setState(() {
      recipeController.clear();
      imagePath = '';
      isEdit = false;
      editDocId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        backgroundColor: const Color(0xFFEB4646),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: imagePath.isEmpty
                      ? const Center(child: Text("Tap to Pick Image"))
                      : Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: recipeController,
                decoration: const InputDecoration(
                  labelText: "Write Recipe",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEB4646),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: saveData,
                  child: Text(isEdit ? "Update Recipe" : "Save Recipe"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}