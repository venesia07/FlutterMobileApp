import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave a Review"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Review Page Coming Soon",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}