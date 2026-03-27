import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/imge.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating1 extends StatefulWidget {
  const Rating1({super.key});

  @override
  State<Rating1> createState() => _Rating1State();
}

class _Rating1State extends State<Rating1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(
                            '4.3',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          allowHalfRating: true,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),

                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              'All ratings(5000+)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: .w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.amber),
                                ),
                                Container(
                                  width: 80,
                                  child: Divider(
                                    color: Colors.amber,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  width: 10,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 3,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '65%',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.amber),
                                ),
                                Container(
                                  width: 10,
                                  child: Divider(
                                    color: Colors.amber,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 3,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '15%',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.amber),
                                ),
                                Container(
                                  width: 5,
                                  child: Divider(
                                    color: Colors.amber,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  width: 85,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 3,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '9%',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.amber),
                                ),
                                Container(
                                  width: 3,
                                  child: Divider(
                                    color: Colors.amber,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  width: 87,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 3,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '4%',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.amber),
                                ),
                                Container(
                                  width: 10,
                                  child: Divider(
                                    color: Colors.amber,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  width: 85,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 3,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '9%',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(
                'Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: .w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        child: Text(
                          'Main',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 1,
                            allowHalfRating: true,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Container(
                            child: Text(
                              'Yesterday',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        child: Text(
                          'there are no burgers in any of deal',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.thumb_up),
                        ),
                        Container(
                          child: Text(
                            'helpful',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(
                'Rate this app',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: .w700,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, _) =>
                  Icon(Icons.star_border, color: Color(0xFFEB4646)),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Container(
              child: Text(
                'Write a review',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: .w400,
                ),
              ),
            ),
            SizedBox(
              height: 76,
              width: 327,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Describe your experience (optional)',
                  hintStyle: TextStyle(
                    color: Color(0xFF808080),
                    fontSize: 17,
                    fontWeight: .w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Imge()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEB4646),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Container(
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(Icons.upload_outlined, color: Colors.white),
                      ),
                    ],
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
