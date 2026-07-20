class Program {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final String location;
  final String category;
  final String description;
  final List<String> requirements;
  final List<String> skills;
  final String image;

  Program({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.category,
    required this.description,
    required this.requirements,
    required this.skills,
    required this.image,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      location: json['location'],
      category: json['category'],
      description: json['description'],
      requirements: List<String>.from(json['requirements']),
      skills: List<String>.from(json['skills']),
      image: json['image'],
    );
  }
}