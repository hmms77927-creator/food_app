import 'package:flutter/material.dart';
import 'package:flutter_application_appnexts/imge.dart';
import 'package:flutter_application_appnexts/registration.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
                    'Account Setting',
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
          GestureDetector(
            onTap: () {},
            child: Center(
              child: SizedBox(
                height: 65,
                width: 346,
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(child: Icon(Icons.lock)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          child: Text(
                            'Change password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(child: Icon(Icons.arrow_forward_ios)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Imge()),
              );
            },
            child: Center(
              child: SizedBox(
                height: 65,
                width: 346,
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 20,
                          width: 25,
                          child: Image.asset('assats/image/Group.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          child: Text(
                            'Edit profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(child: Icon(Icons.arrow_forward_ios)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Registration()),
              );
            },
            child: Center(
              child: SizedBox(
                height: 65,
                width: 346,
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Container(
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset('assats/image/uiw_logout (1).png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
