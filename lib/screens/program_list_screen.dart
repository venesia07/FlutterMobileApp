import 'package:flutter/material.dart';
import '../models/program.dart';
import '../screens/program_details_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class ProgramListScreen extends StatefulWidget {
  const ProgramListScreen({super.key});

  @override
  State<ProgramListScreen> createState() => _ProgramListScreenState();
}

class _ProgramListScreenState extends State<ProgramListScreen> {
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

  List<Program> filteredPrograms = [];

  @override
  void initState() {
    super.initState();
    filteredPrograms = programs;
  }

  void searchProgram(String query) {
    setState(() {
      filteredPrograms = programs.where((program) {
        return program.title
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            program.description
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            program.location
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
    });
  }

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
              onChanged: searchProgram,
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
            child: filteredPrograms.isEmpty
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 70,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text(
                "No Programs Found",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Try searching with a different keyword.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ): ListView.builder(
              itemCount: filteredPrograms.length,
              itemBuilder: (context, index) {
                final program = filteredPrograms[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProgramDetailsScreen(program: program),
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
                              errorBuilder:
                                  (context, error, stackTrace) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey.shade300,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_not_supported,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "No Image",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
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
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;

          case 1:
            // Already on Program List
            break;

          case 2:
            Navigator.pushNamed(context, '/learnerProfile');
            break;
        }
      },       
      ),
    );
  }
}