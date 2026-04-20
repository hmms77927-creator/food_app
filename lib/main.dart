import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/account.dart';
import 'package:flutter_application_appnexts/favorate.dart';
import 'package:flutter_application_appnexts/first.dart';
import 'package:flutter_application_appnexts/first_1.dart';
import 'package:flutter_application_appnexts/food_menu.dart';
import 'package:flutter_application_appnexts/home_V1.dart';
import 'package:flutter_application_appnexts/home_v1.dart' hide HomeV1;
import 'package:flutter_application_appnexts/imge.dart';
import 'package:flutter_application_appnexts/location_1.dart';
import 'package:flutter_application_appnexts/map_1.dart';
import 'package:flutter_application_appnexts/notes.dart';
import 'package:flutter_application_appnexts/rating_1.dart';
import 'package:flutter_application_appnexts/recpies.dart';
import 'package:flutter_application_appnexts/registration.dart';
import 'package:flutter_application_appnexts/registration_1.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';
import 'package:flutter_application_appnexts/setting.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Services/wrapper.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home:Wrapper(),
    );
  }
}