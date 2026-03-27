import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/notes.dart';
import 'package:flutter_application_appnexts/rating_1.dart';
import 'package:flutter_application_appnexts/setting.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: SizedBox(
          height: 210,
          child: Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFFEB4646),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 100),
                    bottomRight: Radius.elliptical(200, 100),
                  ),
                ),
              ),
              Positioned(
                top: 67,
                left: 109,
                child: Container(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                      'assats/image/dbf3866bf07ccc1f5838969233a534fc7019a31c.png',
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
            Container(
              child: Text(
                'Justice Life',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: .w600,
                ),
              ),
            ),
            Container(
              child: Text(
                'justice@justice.life',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 18,
                  fontWeight: .w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setting()),
                );
              },
              child: Center(
                child: SizedBox(
                  height: 65,
                  width: 330,
                  child: Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                'assats/image/Frame.png',
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            child: Text(
                              'Account setting',
                              style: TextStyle(
                                color: Color(0xFF344151),
                                fontSize: 18,
                                fontWeight: .w400,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: 19,
                            width: 19,
                            child: Image.asset(
                              'assats/image/Frame (2).png',
                              width: 19,
                              height: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: 330,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width: 18,
                                  height: 17,
                                  child: Image.asset(
                                    'assats/image/Frame 12.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  child: Text(
                                    'Language',
                                    style: TextStyle(
                                      color: Color(0xFF344151),
                                      fontSize: 18,
                                      fontWeight: .w400,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF344151),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Notes()),
                            );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  child: Image.asset(
                                    'assats/image/Frame (3).png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  child: Text(
                                    'Feedback',
                                    style: TextStyle(
                                      color: Color(0xFF344151),
                                      fontSize: 18,
                                      fontWeight: .w400,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF344151),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width: 20,
                                  height: 21,
                                  child: Image.asset(
                                    'assats/image/Frame 11.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  child: Text(
                                    'Rate us',
                                    style: TextStyle(
                                      color: Color(0xFF344151),
                                      fontSize: 18,
                                      fontWeight: .w400,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF344151),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(
                                    'assats/image/Frame (4).png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  child: Text(
                                    'New Version',
                                    style: TextStyle(
                                      color: Color(0xFF344151),
                                      fontSize: 18,
                                      fontWeight: .w400,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF344151),
                                  ),
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
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 53,
                width: 166,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFEB4646),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5.5),
                      side: BorderSide(color: Color(0xFFEB4646)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: .w700,
                    ),
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
