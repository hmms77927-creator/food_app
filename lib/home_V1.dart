import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/dra_home.dart';
import 'package:flutter_application_appnexts/favorate.dart';
import 'package:flutter_application_appnexts/location_1.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';

class HomeV1 extends StatefulWidget {
  const HomeV1({super.key});

  @override
  State<HomeV1> createState() => _HomeV1State();
}

class _HomeV1State extends State<HomeV1> {
  final List name = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DraHome(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEB4646),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 50),
                    bottomRight: Radius.elliptical(200, 50),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                right: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xFFECF0F4),
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(Icons.menu, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deliver to',
                              style: TextStyle(
                                color: Color(0xFFEB4646),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Halal Lab office',
                                    style: TextStyle(
                                      color: Color(0xFF676767),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFF676767),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hey Leo, ',
                                    style: TextStyle(
                                      color: Color(0xFF1E1D1D),
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Good Afternoon!',
                                    style: TextStyle(
                                      color: Color(0xFF1E1D1D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 35,
                left: 20,
                right: 20,
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search dishes, restaurants',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF676767),
                      ),
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    child: Text(
                      'All Categories',
                      style: TextStyle(fontSize: 16, fontWeight: .w400),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
                    'See All ',
                    style: TextStyle(fontSize: 16, fontWeight: .w400),
                  ),
                ),
                Container(
                  child: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ],
            ),
            Card(
              elevation: 4,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFEB4646),
                          borderRadius: BorderRadius.circular(39),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 30,
                              spreadRadius: 0,
                              color: Color(0xFFEFE6E1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 23,
                              backgroundImage: AssetImage(
                                'assats/image/34f428e47c8da57a9f796e1596d68f1688fa073a.png',
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'All',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(39),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                blurRadius: 12,
                                color: Colors.black.withOpacity(0.15),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundImage: AssetImage(
                                  'assats/image/30fc202b681cf552fb8011ec1be440edbee3f301.png',
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Hot Dog',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(39),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 0,
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundImage: AssetImage(
                                  'assats/image/cbd8173438dd01c6f5e642f129e262e385c4d0cc.png',
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Burger',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: .centerLeft,
                child: Container(
                  child: Text(
                    'Recommended for you ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: .w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: name.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4.0,
                                right: 4,
                                top: 4,
                                bottom: 1,
                              ),
                              child: Container(
                                width: 93,
                                height: 69,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assats/image/ecaa5c0d4bd618634326e8c00080ab106a4c9206.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Le Courno Restaurant ',
                                    style: TextStyle(
                                      color: Color(0xFF181C2E),
                                      fontSize: 22,
                                      fontWeight: .w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Burger - Chicken - Riche \n - Wings ',
                                    style: TextStyle(
                                      color: Color(0xFFA0A5BA),
                                      fontSize: 18,
                                      fontWeight: .w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: Text(
                                  'Open : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '12:00 PM   ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w700,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Text(
                                  'Close : ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '12:00 PM   ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w700,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Favorate(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: Color(0xFFEB4646),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star_border,
                                color: Color(0xFFEB4646),
                              ),
                            ),
                            Container(
                              child: Text(
                                '4.7',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: .w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                top: 0,
                              ),
                              child: SizedBox(
                                width: 116,
                                height: 35,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                      side: BorderSide(
                                        color: Color(0xFFEB4646),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResturantMenu(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Moderate',
                                    style: TextStyle(
                                      color: Color(0xFFEB4646),
                                      fontSize: 14,
                                      fontWeight: .w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 2,
                              ),
                              child: TextButton.icon(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFEB4646),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                    side: BorderSide(color: Color(0xFFEB4646)),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResturantMenu(),
                                    ),
                                  );
                                },
                                label: Text(
                                  'view mensu',
                                  style: TextStyle(color: Colors.white),
                                ),
                                icon: Icon(
                                  Icons.menu_book,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Location1(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Image.asset('assats/image/Vector.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
