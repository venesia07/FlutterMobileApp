import 'package:flutter/material.dart';

import '../services/review_service.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final reviews =
        ReviewService.instance.reviews;

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Reviews"),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: reviews.isEmpty

          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    const Icon(
                      Icons.star_border,
                      size: 90,
                      color: Colors.grey,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "No reviews yet",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Leave reviews after\nparticipating in programs.",
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ),
            )

          : ListView.builder(

              padding:
                  const EdgeInsets.all(16),

              itemCount:
                  reviews.length,

              itemBuilder:
                  (context, index) {

                final review =
                    reviews[index];

                return Card(

                  child: ListTile(

                    leading: const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),

                    title: Text(
                      review.program.title,
                    ),

                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          review.review,
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "⭐ ${review.rating}",
                        ),

                      ],
                    ),

                  ),

                );
              },
            ),
    );
  }
}