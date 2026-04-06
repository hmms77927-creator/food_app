import 'package:get/get.dart';

import '../first.dart';

class Approutes {
  static const String first='/first';
  static final routes=[
    GetPage(name: '/first', page: ()=>First()),
  ];
}