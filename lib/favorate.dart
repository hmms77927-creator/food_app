import 'dart:io';
import 'package:flutter/material.dart';
import 'Models/model_users.dart';

class Favorate extends StatefulWidget {
  final List<FavourateItem> items;
  final VoidCallback onUpdate;

  const Favorate({
    Key? key,
    required this.items,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<Favorate> createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {

  void removeItem(FavourateItem item) {
    setState(() {
      widget.items.removeWhere(
              (e) => e.resturantname == item.resturantname);
    });
    widget.onUpdate();
  }

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
                child: Text(
                  'Favorite',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 126,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assats/image/78f314d8ea7273be57eb0db5224a127f63363cf1.jpg',
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
            const SizedBox(height: 20),
            widget.items.isEmpty
                ? const Center(child: Text("No Favorites Yet"))
                : ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {

                final item = widget.items[index];

                return Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 93,
                              height: 69,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: item.imagePath != null && item.imagePath != ''
                                      ? FileImage(File(item.imagePath!)) // for local files
                                      : const AssetImage('assats/image/default.png') as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.resturantname,
                                style: TextStyle(
                                  color: Color(0xFF181C2E),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                item.description,
                                style: TextStyle(
                                  color: Color(0xFFA0A5BA),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
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
                            child: Text('Open : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                          Text(item.opening,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green)),
                          SizedBox(width: 16),
                          Text('Close : ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          Text(item.closing,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green)),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite,
                                color: Color(0xFFEB4646)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
