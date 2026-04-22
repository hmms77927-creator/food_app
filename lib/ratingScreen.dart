import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  final String restaurantName;

  const RatingScreen({
    super.key,
    required this.restaurantName,
  });

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double ratingValue = 3;
  TextEditingController commentController = TextEditingController();
  Future<void> addReview() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null || widget.restaurantName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in")),
      );
      return;
    }

    await FirebaseFirestore.instance
        .collection('reviews')
        .doc(widget.restaurantName)
        .collection('items')
        .add({
      "rating": ratingValue,
      "comment": commentController.text.trim(),
      "userId": user.uid,
      "createdAt": FieldValue.serverTimestamp(),
    });

    commentController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review Added")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.restaurantName),
      //   backgroundColor: const Color(0xFFEB4646),
      // ),
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
                    'Review Rastaurant ',
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
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('reviews')
                  .doc(widget.restaurantName)
                  .collection('items')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No Reviews Yet"));
                }
                final reviews = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    var review =
                    reviews[index].data() as Map<String, dynamic>;
                    String userId = review['userId'] ?? '';
                    return FutureBuilder<DocumentSnapshot>(
                      future: userId.isNotEmpty
                          ? FirebaseFirestore.instance
                          .collection('users')
                          .doc(userId)
                          .get()
                          : null,
                      builder: (context, userSnap) {
                        String userName = "User";
                        String userImage = "";
                        if (userSnap.hasData &&
                            userSnap.data != null &&
                            userSnap.data!.exists) {
                          final userData = userSnap.data!.data()
                          as Map<String, dynamic>;
                          userName = userData['name'] ?? "User";
                          userImage = userData['image'] ?? "";
                        }
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: userImage.isNotEmpty
                                  ? NetworkImage(userImage)
                                  : null,
                              child: userImage.isEmpty
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                            title: Text(
                              userName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(review['comment'] ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text((review['rating'] ?? 0).toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              itemCount: 5,
              itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (value) {
                ratingValue = value;
              },
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      hintText: "Write review...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addReview,
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFFEB4646),
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