import 'package:flutter/material.dart';
import '../models/program.dart';
import '../screens/program_details_screen.dart';
import '../screens/program_list_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Program> featuredPrograms = [
    Program(
      title: "Mobile App Development",
      startDate: "20 July 2026",
      endDate: "20 August 2026",
      location: "Remote",
      description: "Learn Flutter while building real-world mobile applications.",
      requirements: ["Basic programming", "Laptop", "Internet connection"],
      skills: ["Flutter", "Dart", "Git"],
      image: "assets/images/mobile_app_dev_image.jpg",
    ),
    Program(
      title: "Data Analytics",
      startDate: "01 May 2027",
      endDate: "01 June 2027",
      location: "Hybrid",
      description: "Learn SQL, Power BI and Python.",
      requirements: ["Analytical thinking", "Laptop"],
      skills: ["SQL", "Power BI", "Python"],
      image: "assets/images/data_analytics_image.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Excelerate Connect"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Discover internships, workshops and competitions.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          TextField(
            readOnly: true,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProgramListScreen()),
            ),
            decoration: InputDecoration(
              hintText: "Search programs...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Featured Programs",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProgramListScreen()),
                ),
                child: const Text("See All"),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: featuredPrograms.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final program = featuredPrograms[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgramDetailsScreen(program: program),
                    ),
                  ),
                  child: Card(
                    elevation: 4,
                    child: SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                            child: Image.asset(
                              program.image,
                              height: 100,
                              width: 180,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 100,
                                  width: 180,
                                  color: Colors.grey.shade300,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
                                      SizedBox(height: 4),
                                      Text("No Image", style: TextStyle(fontSize: 11, color: Colors.grey)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  program.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today, size: 12),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        program.startDate,
                                        style: const TextStyle(fontSize: 11),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
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
          const SizedBox(height: 24),
          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProgramListScreen()),
                  ),
                  icon: const Icon(Icons.menu_book),
                  label: const Text("Programs"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                  label: const Text("Profile"),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProgramListScreen()),
            );
          }
          // index 2 (Profile) left as-is until Brayson's screen is confirmed/merged
        },
      ),
    );
  }
}