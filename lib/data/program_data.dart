import '../models/program.dart';

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