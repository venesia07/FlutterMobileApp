import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.groups,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),

            const Center(
              child: Text(
                "About Us",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Excelerate is a mobile application that brings internships, workshops, competitions, and masterclasses together in one platform. It helps learners easily discover programs, register for opportunities, and share feedback, while providing administrators with a more efficient way to manage announcements, participant tracking, and responses.",
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mission",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "To provide an accessible and user-friendly platform that connects learners with educational opportunities while simplifying program management for administrators.",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vision",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                       "To become a trusted platform that empowers learners through accessible education, innovation, and meaningful opportunities for personal and professional growth.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}