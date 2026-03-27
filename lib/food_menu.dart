import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/setting.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SizedBox(
          height: 200,
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
                    'Food  Menu ',
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
      body: Column(
        children: [
          Container(
            child: Text(
              'Le Courno’s Restorentie',
              style: TextStyle(fontSize: 20, fontWeight: .w400),
            ),
          ),
          SizedBox(
            height: 530,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 572,
                  child: Image.asset(
                    'assats/image/74913a264fa40fe3147cd8b9d9ae67ad4111b0f9.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 230.0),
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Setting(),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios),
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
    );
  }
}
