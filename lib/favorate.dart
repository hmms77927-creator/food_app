import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/location_1.dart';
import 'package:flutter_application_appnexts/resturant_menu.dart';

class Favorate extends StatefulWidget {
  const Favorate({super.key});

  @override
  State<Favorate> createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {
  final name = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              Container(
                height: 115,
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
                top: 23,
                left: 14,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              Positioned(
                top: 30,
                left: 125,
                child: Container(
                  child: Text(
                    'Favorite',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 126,
                child: Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assats/image/78f314d8ea7273be57eb0db5224a127f63363cf1.jpg',
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
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
                                  'view menu',
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
