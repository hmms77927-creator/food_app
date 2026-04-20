import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_appnexts/home_V1.dart' hide HomeV1;
import 'package:flutter_application_appnexts/registration_1.dart';

import '../first.dart';
import '../home_v1.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
   User? user =FirebaseAuth.instance.currentUser;
   if(user!=null){
     return HomeV1();
   }else{
     return First();
   }
  }
}