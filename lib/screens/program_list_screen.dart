import "package:flutter/material.dart";
import '../models/program.dart';
import '../screens/program_details_screen.dart';
import '../widgets/bottom_nav_bar.dart';

 class ProgramListScreen extends StatelessWidget {
  ProgramListScreen({super.key});

  // Sample programs
  final List<Program> programs = [
    Program(
      title: "Mobile App Development",
      startDate: "20 July 2026",
      endDate: "20 August 2026",
      location: "Remote",
      description:
          "Learn Flutter while building real-world mobile applications.",
      requirements: [
        "Basic programming",
        "Laptop",
        "Internet connection",
      ],
      skills: [
        "Flutter",
        "Dart",
        "Git",
      ],
      image: "assets/images/mobile_app_dev_image.jpg",
    ),
    Program(
      title: "Data Analytics",
      startDate: "01 May 2027",
      endDate: "01 June 2027",
      location: "Hybrid",
      description: "Learn SQL, Power BI and Python.",
      requirements: [
        "Analytical thinking",
        "Laptop",
      ],
      skills: [
        "SQL",
        "Power BI",
        "Python",
      ],
      image: "assets/images/data_analytics_image.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Programs"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search programs...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: programs.length,
              itemBuilder: (context, index) {
                final program = programs[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(12),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramDetailsScreen(
                          program: program,
                        ),
                      ),
                    );
                  },

                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              program.image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  program.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  program.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(program.startDate),
                                  ],
                                ),

                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(program.location),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          currentIndex: 1,
          onTap: (index) {
                if (index == 0) {
                    // Home
                }
                if (index == 1) {
                    // Already on Programs
                }
                if (index == 2) {
                  // Profile
                }
          },
      ),
    );
    
  }
}