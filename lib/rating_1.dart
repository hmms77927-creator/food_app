import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class Rating1 extends StatefulWidget {
  const Rating1({super.key});

  @override
  State<Rating1> createState() => _Rating1State();
}

class _Rating1State extends State<Rating1> {
  double userRating = 0.0;
  TextEditingController reviewController = TextEditingController();

  // ================= GET USER DATA =================
  Future<Map<String, dynamic>?> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    return doc.data();
  }

  // ================= FORMAT DATE =================
  String formatDate(Timestamp timestamp) {
    final date = timestamp.toDate();
    return DateFormat('dd MMM yyyy • hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR (SAME UI) =================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              Container(
                height: 115,
                width: double.infinity,
                decoration: const BoxDecoration(
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
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              const Positioned(
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
              const Positioned(
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

      // ================= BODY =================
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('reviews')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];

          int totalRatings = docs.length;

          // ================= AVERAGE =================
          double avgRating = 0;
          Map<int, int> starCount = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};

          if (totalRatings > 0) {
            double sum = 0;
            for (var doc in docs) {
              final data = doc.data() as Map<String, dynamic>;
              int rating = (data['rating'] ?? 0).toInt();
              sum += rating;

              if (starCount.containsKey(rating)) {
                starCount[rating] = starCount[rating]! + 1;
              }
            }
            avgRating = sum / totalRatings;
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ================= AVERAGE CARD =================
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                avgRating.toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              RatingBar.builder(
                                initialRating: avgRating,
                                minRating: 1,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                ignoreGestures: true,
                                itemBuilder: (context, _) =>
                                const Icon(Icons.star,
                                    color: Colors.amber),
                                onRatingUpdate: (_) {},
                              ),
                              Text('All ratings ($totalRatings)'),
                            ],
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: Column(
                              children: List.generate(5, (index) {
                                int star = 5 - index;
                                int count = starCount[star] ?? 0;
                                double percent = totalRatings == 0
                                    ? 0
                                    : count / totalRatings;

                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      Text('$star'),
                                      const Icon(Icons.star,
                                          color: Colors.amber),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Container(
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child: FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor: percent,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text('${(percent * 100).toInt()}%'),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Reviews',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  // ================= REVIEWS =================
                  if (docs.isEmpty)
                    const Text('No Reviews Yet')
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final data =
                        docs[index].data() as Map<String, dynamic>;

                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                data['userProfile'] ??
                                    'https://www.gravatar.com/avatar/placeholder',
                              ),
                            ),
                            title: Text(
                              data['userName'] ?? 'User',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),

                                // ⭐ stars
                                Row(
                                  children: List.generate(
                                    5,
                                        (i) => Icon(
                                      i < (data['rating'] ?? 0)
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // 📝 review
                                Text(data['review'] ?? ''),

                                const SizedBox(height: 4),

                                // ⏰ date & time
                                Text(
                                  data['createdAt'] != null
                                      ? formatDate(
                                      data['createdAt'])
                                      : '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 10),

                  const Text(
                    'Rate this app',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) =>
                    const Icon(Icons.star_border,
                        color: Color(0xFFEB4646)),
                    onRatingUpdate: (rating) {
                      userRating = rating;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: reviewController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Write review...',
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ================= BUTTON =================
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (userRating == 0) return;

                        final userData = await getUserData();
                        final uid =
                            FirebaseAuth.instance.currentUser!.uid;

                        await FirebaseFirestore.instance
                            .collection('reviews')
                            .add({
                          'rating': userRating,
                          'review': reviewController.text,
                          'userName': userData?['name'] ?? 'User',
                          'userProfile': userData?['photo'] ?? '',
                          'createdAt': FieldValue.serverTimestamp(),
                        });

                        reviewController.clear();
                        setState(() {
                          userRating = 0;
                        });
                      },
                      icon: const Icon(Icons.upload),
                      label: const Text('Upload Review'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEB4646),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}