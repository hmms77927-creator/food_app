import 'package:flutter/foundation.dart';

class UserModel {
  final String resturantname;
  final String description;
  final String opening;
  final String closing;

  UserModel({
    required this.resturantname,
    required this.description,
    required this.opening,
    required this.closing,
  });

  // 🔥 fromMap (Firebase → App)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      resturantname: map['resturantname'] ?? '',
      description: map['description'] ?? '',
      opening: map['opening'] ?? '',
      closing: map['closing'] ?? '',
    );
  }

  // 🔥 toMap (App → Firebase)
  Map<String, dynamic> toMap() {
    return {
      'resturantname': resturantname,
      'description': description,
      'opening': opening,
      'closing': closing,
    };
  }
}

class FavourateItem {
  final String resturantname;
  final String description;
  final String opening;
  final String closing;
  final String imagePath;

  FavourateItem({
    required this.resturantname,
    required this.description,
    required this.opening,
    required this.closing,
    required this.imagePath,
  });

  factory FavourateItem.fromMap(Map<String, dynamic> data) {
    return FavourateItem(
      resturantname: data['resturantname'] ?? '',
      description: data['description'] ?? '',
      opening: data['opening'] ?? '',
      closing: data['closing'] ?? '',
      imagePath: data['image']??'',
    );
  }
}